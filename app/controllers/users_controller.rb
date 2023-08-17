class UsersController < ApplicationController
  #   acts_as_taggable_on :tags
  respond_to :html, :xml, :js

  before_action :authenticate_user!

  def index
    @users = params[:skill]
    @users = if @users.present?
               User.tagged_with(params[:skill])
             else
               User.all
             end
    # byebug
    respond_with do |format|
      format.html
      format.js
    end

    # @user = User.find_by(id: current_user)
  end

  def new; end

  # def show
  #   # @beer = Beer.find(params[:id])
  #   # @beer2 = @beer.id
  #   @users = if params[:tag].present?
  #              byebug
  #              User.tagged_with(params[:tag])
  #            else
  #              User.all
  #            end
  # end

  # def tagged
  #   @users = if params[:tag].present?
  #              User.tagged_with(params[:tag])
  #            else
  #              User.all
  #            end
  # end

  def reply
    @contact_us = ContactUs.where(user_id: current_user)
  end
end
