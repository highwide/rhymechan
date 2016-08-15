require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test 'should split content into phrases' do
    message = Message.new(content: "I wanna be a livin' legend. 生きている時に, 死ぬ前にはrich、生きてる伝説。死んだら意味ない！")
    phrases = message.split_content_into_phrases
    assert_equal "I wanna be a livin' legend", phrases[0]
    assert_equal '生きている時に', phrases[1]
    assert_equal '死ぬ前にはrich', phrases[2]
    assert_equal '生きてる伝説', phrases[3]
    assert_equal '死んだら意味ない', phrases[4]
  end
end
