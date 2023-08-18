class UsersController < ApplicationController
  #   acts_as_taggable_on :tags
  respond_to :html, :xml, :js

  before_action :authenticate_user!

  def index
    # @users = params[:skill]
    # byebug
    @query = params[:search]
    # byebug
    @users = if @query.present?
               users_with_both_tags = User.tagged_with(@query, on: :skills) & User.tagged_with(@query, on: :experiences)
               users_with_either_tag = User.tagged_with(@query,
                                                        on: :skills) | User.tagged_with(@query, on: :experiences)
               #  byebug
               #  elsif @query.present?
               #    User.tagged_with(@query, on: :experiences)
               if users_with_both_tags.present?
                 users_with_both_tags
               else
                 users_with_either_tag
               end
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
