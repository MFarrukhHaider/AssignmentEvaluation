class UsersCommentsController < ApplicationController
    def index
        @users_comments=UsersComment.all

    end
    def show
      @beer = Beer.find(params[:id])
      @beer2=@beer.id
      # byebug
    end

    def edit
        @user_comment=UsersComment.find(params[:id])
    end

    def new

      @user_comment=UsersComment.new
      @beer_id=params[:"beer_id"]


    end

    def create
      @beer_id=params[:"beer_id"]
      comment_params = params.require(:users_comment).permit(:description)
      user_id = current_user.id

      @user_comment = UsersComment.new(comment_params.merge(user_id: user_id,beer_id: @beer_id))
      if @user_comment.save
          redirect_to root_path
        else
          render :new, status: :unprocessable_entity
        end
      end

  def comment_params
      params.require(:users_comment).permit(:user_id,:beer_id,:description)
  end
end