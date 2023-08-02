class BeersController < ApplicationController


  def index
    @beers=Beer.all
    @user=User.find_by(id: current_user)
    # byebug
  end
  def index1

  end
  def show
    @beer = Beer.find(params[:id])
    @beer2=@beer.id
  end

    def fetch_data_from_public_api
        public_api_service = PublicApiService.new
        data_from_api = public_api_service.fetch_data

        data_from_api.each do |data|

          abc={
            name: data['name'],
            tagline: data['tagline'],
            first_brewed: data['first_brewed'],
            description: data['description'],
            alcohol_by_volume: data['abv'],
            ibu: data['ibu'],
            ebc: data['ebc'],
            srm: data['srm'],
            ph: data['ph'],
            attenuation_level: data['attenuation_level'],
            volume: data['volume'],
            boil_volume: data['boil_volume'],
            method: data['method'],
            ingredients: data['ingredients'],
            food_pairing: data['food_pairing'],
            brewers_tips: data['brewers_tips']
          }

          your_model = Beer.new(abc)

          your_model.save()
        end
    end
end
