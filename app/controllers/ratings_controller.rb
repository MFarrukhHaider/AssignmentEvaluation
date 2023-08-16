class RatingsController < ApplicationController
    def index
    end

    def show
        @beer=Beer.find(params[:beer_id])
    end

    def new
        @beer=Beer.find(params[:beer_id])
        @rating = Rating.new()

    end

    def create
        params[:rating][:beer_rating] = params[:rating][:beer_rating].to_i
        @rating = Rating.new(rating_params)

        if @rating.save!
            redirect_to root_path
          else
            render :new, status: :unprocessable_entity
          end
        end
  
    def rating_params
        params.require(:rating).permit(:beer_id, :beer_rating, :user_id)
    end
end
