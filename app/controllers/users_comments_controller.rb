class UsersCommentsController < ApplicationController
    def index
        @users_comments=UsersComment.all

    end

    def edit
        @user_comment=UsersComment.find(params[:id])
    end

    def new
        @user_comment=UsersComment.new
    end

    def create
      comment_params = params.require(:users_comment).permit(:beer_id, :description)
      user_id = current_user.id
  
      @user_comment = UsersComment.new(comment_params.merge(user_id: user_id))
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