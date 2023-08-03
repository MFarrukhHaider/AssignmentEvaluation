class Beer < ApplicationRecord
    belongs_to :user
    has_many :ratings
    has_many :favorite_beers
    has_many :users_comments
    def self.ransackable_attributes(auth_object = nil)
        ["alcohol_by_volume", "attenuation_level", "boil_volume", "brewers_tips", "created_at", "description", "ebc", "first_brewed", "food_pairing", "ibu", "id", "ingredients", "method", "name", "ph", "srm", "tagline", "updated_at", "user_id", "volume"]
      end
    # def self.ransackable_attributes(auth_object = nil)
    #     ["alcohol_by_volume", "attenuation_level", "boil_volume", "brewers_tips", "created_at", "description", "ebc", "first_brewed", "food_pairing", "ibu", "id", "ingredients", "method", "name", "ph", "srm", "tagline", "updated_at", "user_id", "volume"]
    #   end
    # # end
    def self.ransackable_associations(auth_object = nil)
        ["users_comments", "favorite_beers", "ratings"]
      end

end
