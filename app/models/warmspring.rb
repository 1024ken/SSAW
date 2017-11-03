class Warmspring < ApplicationRecord
  validates :title, :content, presence: true
end
