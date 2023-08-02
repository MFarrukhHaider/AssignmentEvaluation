class RatingsController < ApplicationController
    def index
        @users=User.all
        @beers=Beer.all
    end
end
