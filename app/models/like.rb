class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :user, uniqueness: true, presence: true
  validates :post, uniqueness: true, presence: true
end
