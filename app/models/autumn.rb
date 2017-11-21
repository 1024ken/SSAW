class Autumn < ApplicationRecord
  belongs_to :user
  has_many :autumn_comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :title, :content, presence: true
  has_many :likes, as: :likeable
end
