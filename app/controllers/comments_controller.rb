class CommentsController < ApplicationController
    def index
        @comments=Comment.all

    end

    def edit
        @comment=Comment.find(params[:id])
    end

    def new
        @comment=Comment.new
    end

    def create
      comment_params = params.require(:comment).permit(:beer_id, :description)
      user_id = current_user.id
  
      @comment = Comment.new(comment_params.merge(user_id: user_id))
      if @comment.save
          redirect_to root_path
        else
          render :new, status: :unprocessable_entity
        end
      end

  def comment_params
      params.require(:comment).permit(:user_id,:beer_id,:description)
  end
end

