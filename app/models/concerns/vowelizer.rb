module Vowelizer
  extend ActiveSupport::Concern

  def vowelize(kana_text)
    simple_vowelize(kana_text)
      .gsub(/(.ャ)/, 'ア')
      .gsub(/(.ュ)/, 'ウ')
      .gsub(/(.ョ)/, 'オ')
      .gsub(/[ア|ァ]+ァ/) {|text| text.chars.map { |_| 'ア' }.join }
      .gsub(/[イ|ィ]+ィ/) {|text| text.chars.map { |_| 'イ' }.join }
      .gsub(/[ウ|ゥ]+ゥ/) {|text| text.chars.map { |_| 'ウ' }.join }
      .gsub(/[エ|ェ]+ェ/) {|text| text.chars.map { |_| 'エ' }.join }
      .gsub(/[オ|ォ]+ォ/) {|text| text.chars.map { |_| 'オ' }.join }
      .gsub(/[ア|イ|ウ|エ|オ][ァ|ィ|ゥ|ェ|ォ]/) {|text| (text[1].ord + 1).chr }
      .gsub(/[ア|イ|ウ|エ|オ]ー/) {|text| text[0] * 2}
    end

  def simple_vowelize(kana_text)
    kana_text.chars.map do |c, i|
      if c.in? %w(ア カ サ タ ナ ハ マ ヤ ラ ワ ガ ザ ダ バ パ)
        'ア'
      elsif c.in? %w(イ キ シ チ ニ ヒ ミ リ ギ ジ ヂ ビ ピ)
        'イ'
      elsif c.in? %w(ウ ク ス ツ ヌ フ ム ユ ル ヴ グ ズ ヅ ブ プ)
        'ウ'
      elsif c.in? %w(エ ケ セ テ ネ ヘ メ レ ゲ ゼ デ ベ ペ)
        'エ'
      elsif c.in? %w(オ コ ソ ト ノ ホ モ ヨ ロ ヲ ゴ ゾ ド ボ ポ)
        'オ'
      elsif c == 'ン'
        'ン'
      elsif c == 'ッ'
        'ッ'
      else
        c
      end
    end.join
  end
end
