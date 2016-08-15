class Text
  include ActiveModel::Model
  include Vowelizable

  attr_reader :vowel

  SMALL_AIUEO = %w(ァ ィ ゥ ェ ォ).freeze
  SMALL_YAYUYO = %w(ャ ュ ョ).freeze

  def initialize(text)
    @text = text
    @vowel = vowelize(pronunciation)
  end

  def pronunciation
    @pronunciation ||= parsed_text.map do |word|
      mecab_candidate = word.values.first.slice(8)
      original_word = word.keys.first
      if mecab_candidate.present?
        mecab_candidate
      elsif pronouncable?(original_word)
        original_word
      else
        original_word.chars.map { 'x' }
      end
    end.join
  end

  private

    def parsed_text
      return @parsed_text if @parsed_text.present?
      parsed_text = []
      Natto::MeCab.new
                  .parse(@text)
                  .split
                  .select { |item| item != 'EOS' }
                  .each_slice(2) do |k, v|
                    parsed_text << { k => v&.split(',') }
                  end
      @parsed_text = parsed_text
    end

    def pronouncable?(text)
      text =~ /^[\p{hiragana}|\p{katakana}|ー]+$/
    end
end
