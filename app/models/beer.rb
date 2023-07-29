class Beer < ApplicationRecord
    has_many :ratings
    has_many :favorite_beers
    has_many :comments
    def self.ransackable_attributes(auth_object = nil)
        %w[name tagline abv ibu description first_brewed alcohol_by_volume ibu ebc abv srm ph attenuation_level volume boil_volume method ingredients food_pairing brewers_tips created_at updated_at]

    end
    def self.ransackable_associations(auth_object = nil)
        # List the associations you want to be searchable
        ["comments", "favorite_beers", "ratings"]
      end

end
