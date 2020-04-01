class Post < ApplicationRecord
  validates :photo, presence: true
  validates :description, presence: true

  belongs_to :user
  has_one_attached :photo
  
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
