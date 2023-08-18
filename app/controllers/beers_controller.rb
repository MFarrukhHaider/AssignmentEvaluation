class BeersController < ApplicationController
  respond_to :html, :xml, :js

  # before_action :authenticate_user!

  def index
    @user_beers = current_user.beers
  end

  def beer_info
    # byebug
    @query = params[:search]
    @search_results = if @query.present?
                        name = Beer.where('name LIKE ?', "%#{@query}%")
                        tagline = Beer.where('tagline LIKE ?', "%#{@query}%")
                        attenuation_level = Beer.where('attenuation_level LIKE ?', "%#{@query}%")
                        if name.present?
                          name
                        elsif tagline.present?
                          tagline
                        elsif attenuation_level.present?
                          attenuation_level
                        else
                          Beer.all
                        end
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
