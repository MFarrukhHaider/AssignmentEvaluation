class BeersController < ApplicationController
  respond_to :html, :xml, :js

  # before_action :authenticate_user!

  def index
    @user_beers = current_user.beers
  end

  def beer_info
    # byebug
    @query = params[:search]
    @search_results = if @query
                        Beer.where('name LIKE ?', "%#{@query}%")
                      # byebug
                      else
                        Beer.all
                      end
    # byebug
    respond_with do |format|
      # byebug
      format.html { render :beer_info }
      format.js
    end
  end

  def main_index_page
    @user = User.find_by(id: current_user)
  end

  def show
    @beer = Beer.find(params[:id])
  end
end
