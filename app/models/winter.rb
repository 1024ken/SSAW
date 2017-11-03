class Winter < ApplicationRecord
  validates :title, :content, presence: true
end
