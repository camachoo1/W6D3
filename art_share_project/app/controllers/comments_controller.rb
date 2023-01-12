class CommentsController < ApplicationController
  def index
    if params.has_key?(:artwork_id)
      @comments = Comment.comments_for_artwork(params[:artwork_id])
    elsif params.has_key?(:user_id)
      @comments = Comment.comments_for_commenter(params[:user_id])
    else
      return render plain: "Invalid ID's", status: 422
    end
    render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)
    # @comment.commenter_id = params[:commenter_id]
    if @comment.save!
      # render plain: "Comment successfully added"
      redirect_to artwork_comments_url(@comment.artwork_id)
    else
      render json: @comment.errors.full_messages, status: 422
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])

    if @comment.destroy
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: 422
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :commenter_id, :artwork_id)
  end
end
