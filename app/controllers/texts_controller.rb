class TextsController < ApplicationController
  before_action :set_text, only: [:index]

  def index
    if @base_text.present?
      @pronunciation = @base_text.pronunciation
      @vowel = @base_text.vowel
      @results = search(@vowel)
    end
  end

  private

  def set_text
    @base_text = Text.new(params[:body]) if params[:body].present?
  end

  def search(vowel)
    length = vowel.length
    return nil if length < 3

    start = (length >= 10) ? 10 : length
    # 10文字から3文字まで韻踏めるか検索
    start.downto(3).map do |n|
      SearchableWord
        .where(vowel[(-1 * n)..-1])
        .response.hits.hits
    end.flatten.take(100)
  end
end
