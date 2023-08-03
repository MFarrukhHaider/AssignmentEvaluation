class AddBeerRatingToRatings < ActiveRecord::Migration[6.1]
  def change
    add_column :ratings, :beer_rating, :integer
  end
end
