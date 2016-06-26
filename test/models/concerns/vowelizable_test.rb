require 'test_helper'

class VowelizableTest < ActiveSupport::TestCase
  setup do
    @vowelizable = Struct.new(:vowelizable) { include Vowelizable }.new
  end

  test 'vowelize should vowelize provided text' do
    assert_equal 'アオ',
                 @vowelizable.vowelize('ダボ')
    assert_equal 'アイウエウウエオオオエウオオイオ',
                 @vowelizable.vowelize('サイプレスウエノトロベルトヨシノ')
  end

  test 'vowelize should vowelize text with small charafters' do
    assert_equal 'ウアエウ',
                 @vowelizable.vowelize('ヌジャベス')
    assert_equal 'アンア',
                 @vowelizable.vowelize('ハンニャ')
    assert_equal 'ウアッウ',
                 @vowelizable.vowelize('クラッシュ')
  end

  test 'vowelize should vowelize text with long vowel' do
    assert_equal 'イイア',
                 @vowelizable.vowelize('シーダ')
    assert_equal 'アアアイイ',
                 @vowelizable.vowelize('アナーキー')
    assert_equal 'イオオアイウオオンアンアアウアウンオ',
                 @vowelizable.vowelize('ニトロマイクロフォンアンダーグラウンド')
  end
end
