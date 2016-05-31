class Text
  include ActiveModel::Model
  include Vowelizer

  attr_accessor :body
  attr_accessor :parsed_text
  attr_accessor :pronunciation
  attr_accessor :vowel

  SMALL_AIUEO = %w(ァ ィ ゥ ェ ォ)
  SMALL_YAYUYO = %w(ャ ュ ョ)

  def initialize(body)
    @body = body
    @parsed_text = parse_text(body)
    @pronunciation = pronunce(@parsed_text)
    @vowel = vowelize(@pronunciation)
  end

  private

  def parse_text(text)
    parse_text = []
    Natto::MeCab.new
      .parse(text)
      .split
      .select{ |item| item != 'EOS' }
      .each_slice(2) { |k, v| parse_text << { k => v&.split(',') } }
    parse_text
  end

  def pronunce(parsed_text)
    parsed_text.map do |word|
      mecab_candidate = word.values.first.slice(8)
      original_word = word.keys.first
      if mecab_candidate.present?
        mecab_candidate
      elsif pronuncable?(original_word)
        original_word
      else
        original_word.chars.map { |_| 'x' }
      end
    end.join
  end

  def pronuncable?(text)
    text =~ /^[\p{hiragana}|\p{katakana}|ー]+$/
  end

end
