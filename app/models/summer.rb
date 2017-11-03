class Summer < ApplicationRecord
  validates :title, :content, presence: true
end
