class Message < ApplicationRecord
  validates :content, presence: true

  def make_rhymes_from_content
    split_content_into_phrases.inject([]) do |acc, phrase|
      next acc if phrase.blank?
      acc << Rhyme.new(phrase)
    end
  end

  def split_content_into_phrases
    content.strip.split(/。|\.|、|,|!|！|\?|？/).map(&:strip)
  end
end
