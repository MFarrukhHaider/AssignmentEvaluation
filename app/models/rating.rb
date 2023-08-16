class Rating < ApplicationRecord
  scope :highly_rated, ->{where(beer_rating:"Excellent")}

  belongs_to :user
  belongs_to :beer
  enum beer_rating: {Excellent: 10, Good: 8, Average: 6, Bad: 4, Very_Bad: 0}
  def self.ransackable_attributes(auth_object = nil)
    ["beer_id", "created_at", "id", "beer_rating", "updated_at", "user_id"]
  end
end
