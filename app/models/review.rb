class Review < ApplicationRecord
  validates :body, presence: true
  validates :rating, presence: true
  belongs_to :user
  belongs_to :book

end
