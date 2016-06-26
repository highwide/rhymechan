require 'test_helper'

class TextTest < ActiveSupport::TestCase
  test 'vowelize should vowelize provided text' do
    assert_equal 'オンイイアエアイ',
                 @vowelizable.vowelize('コンニチハセカイ')
  end
end
