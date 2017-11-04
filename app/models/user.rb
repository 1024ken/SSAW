class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :warmspring
  has_many :summer
  has_many :autumn
  has_many :winter

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
end
