class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
        @beers=Beer.all
        @user=User.find_by(id: current_user)
    end

    def new
    end

    def show
        @beer = Beer.find(params[:id])
        @beer2=@beer.id
        # byebug
    end
end
