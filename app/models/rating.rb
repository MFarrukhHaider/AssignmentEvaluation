class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  def self.ransackable_attributes(auth_object = nil)
    ["beer_id", "created_at", "id", "rating", "updated_at", "user_id"]
  end
end
