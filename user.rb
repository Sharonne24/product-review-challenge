class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def remove_reviews(product)
      reviews.where(product: product).destroy_all
    end

  def favorite_product
    products.order(reviews: :desc).first
  end
end



 