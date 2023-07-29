class CreateFavoriteBeers < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_beers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :beer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
