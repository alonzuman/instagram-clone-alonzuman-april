class Post < ApplicationRecord
  validates :photo, presence: true
  validates :description, presence: true
  belongs_to :user, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :photo
end
