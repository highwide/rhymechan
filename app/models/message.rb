class Message < ApplicationRecord
  validates :content, presence: true

  mount_uploader :icon, IconUploader

  def make_rhymes_from_content
    split_content_into_phrases.inject([]) do |acc, phrase|
      next acc if phrase.blank?
      acc << Rhyme.new(phrase)
    end
  end

  alias_method :rhymes, :make_rhymes_from_content

  def split_content_into_phrases
    content.strip.split(/。|\.|、|,|!|！|\?|？/).map(&:strip)
  end
end
