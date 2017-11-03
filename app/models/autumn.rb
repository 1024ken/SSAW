class Autumn < ApplicationRecord
  validates :title, :content, presence: true
end
