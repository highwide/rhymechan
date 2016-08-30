require 'test_helper'

class RhymeTest < ActiveSupport::TestCase
  setup do
    @rhyme = Rhyme.new('これも未来じゃ小さな話')
  end

  test 'should have text' do
    assert_instance_of Text, @rhyme.text
  end

  test "should delegate to text's pronunciation" do
    assert_equal @rhyme.text.pronunciation, @rhyme.pronunciation
  end

  test "should delegate to text's vowel" do
    assert_equal @rhyme.text.vowel, @rhyme.vowel
  end

  test 'should have results converted to rhyme' do
    assert_instance_of Array, @rhyme.results
    assert_equal 10, @rhyme.results.size
    assert_equal 'キーパーチャージ', @rhyme.results[0]._source.word
    assert_equal 'ジャミーラ・高橋', @rhyme.results[1]._source.word
  end

  test 'should have empty result when phraze is shorter than 3' do
    rhyme = Rhyme.new('これ')
    assert_instance_of Array, rhyme.results
    assert rhyme.results.empty?
  end
end
