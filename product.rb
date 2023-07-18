class Product < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  def leave_review(user, star_rating, comment)
    Review.create(user: user, product: self, star_rating: star_rating, comment: comment)
  end

  def print_all_reviews
    reviews.each(&:print_review)
  end

  def average_rating
    total_ratings = reviews.sum(:star_rating)
    total_reviews = reviews.count
    total_reviews > 0 ? total_ratings.to_f / total_reviews : 0
  end
end