class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all
  end

  def show
    phrases = @message.content.strip.split(/。|\.|、|,|!|！|\?|？/)

    rhyme = Struct.new(:original, :pronunciation, :vowel, :results)

    @rhymes = phrases.inject([]) do |acc, content|
      next acc if content.blank?
      text = Text.new(content)
      acc << rhyme.new(
        content,
        text.pronunciation,
        vowel = text.vowel,
        search(vowel)
      )
    end
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to @message, notice: 'Message was successfully created.'
    else
      render :new
    end
  end

  def update
    if @message.update(message_params)
      redirect_to @message, notice: 'Message was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @message.destroy
    redirect_to messages_url, notice: 'Message was successfully destroyed.'
  end

  private

    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:content)
    end

    # @todo Move and make it DRY
    def search(vowel)
      length = vowel.length
      return nil if length < 3

      start = (length >= 10) ? 10 : length
      # 10文字から3文字まで韻踏めるか検索
      start.downto(3).map do |n|
        SearchableWord
          .where(vowel[(-1 * n)..-1])
          .response.hits.hits
      end.flatten.take(5)
  end
end
