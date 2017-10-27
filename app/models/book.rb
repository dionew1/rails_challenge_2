class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :reviews
  has_many :users, through: :reviews

  def average_rating
    reviews.average(:rating).round(1)
  end

  def highest_rating
    reviews.order("rating DESC")
  end

  def lowest_rating
    reviews.order("rating ASC")
  end
end
