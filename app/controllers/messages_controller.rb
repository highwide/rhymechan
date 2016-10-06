class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]

  def index
    @messages = Message.order(updated_at: :desc)
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to messages_url, notice: 'Message was successfully created.'
    else
      render :new
    end
  end

  def update
    if @message.update(message_params)
      redirect_to messages_url, notice: 'Message was successfully updated.'
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
      params.require(:message).permit(*%i(content created_by icon))
    end
end
