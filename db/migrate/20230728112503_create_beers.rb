class CreateBeers < ActiveRecord::Migration[6.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :tagline
      t.string :first_brewed
      t.string :description
      t.string :alcohol_by_volume
      t.string :ibu
      t.string :ebc
      t.string :srm
      t.string :ph
      t.string :attenuation_level
      t.json :volume
      t.json :boil_volume
      t.json :method
      t.json :ingredients
      t.json :food_pairing
      t.string :brewers_tips

      t.timestamps
    end
  end
end
