# frozen_string_literal: true

require 'test_helper'

class TextTest < ActiveSupport::TestCase
  test 'should get pronunciation of text' do
    @text = Text.new('般若')
    assert_equal 'ハンニャ', @text.pronunciation

    @text = Text.new('鎮座ドープネス')
    assert_equal 'チンザドープネス', @text.pronunciation

    @text = Text.new('シンゴ西成')
    assert_equal 'シンゴニシナリ', @text.pronunciation
  end

  test 'should set "x" for characters without candidates' do
    @text = Text.new('妄走族')
    assert_equal 'xxゾク', @text.pronunciation

    @text = Text.new('KダブSHINE')
    assert_equal 'xダブxxxxx', @text.pronunciation
  end

  test 'should set vowel of test' do
    @text = Text.new('般若')
    assert_equal 'アンア', @text.vowel
  end
end
