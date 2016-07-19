class Message < ApplicationRecord
  validates :content, presence: true

  def split_content_into_phrases
    content.strip.split(/。|\.|、|,|!|！|\?|？/)
  end
end
