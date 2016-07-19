class Message < ApplicationRecord
  validates :content, presence: true
end
