class Rhyme
  attr_reader :phrase, :number
  delegate :pronunciation, :vowel, to: :text

  # number に結果の個数を指定する
  def initialize(phrase, number: 10)
    @phrase = phrase
    @number = number
  end

  def text
    @text ||= Text.new(phrase)
  end

  def results
    @results ||= convert_phrases_into_rhymes
  end

  private

    def convert_phrases_into_rhymes
      length = vowel.length
      return [] if length < 3

      # 10文字から3文字まで韻踏めるか検索
      (length >= 10 ? 10 : length).downto(3).map do |n|
        SearchableWord.where(vowel[-n..-1]).response.hits.hits
      end.flatten.take(@number)
    end
end
