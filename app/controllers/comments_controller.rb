class CommentsController < ApplicationController
  before_action :set_discussion
  before_action :authenticate_user!
  def create
    @comment = @discussion.comments.new({body: params[:comment][:body], discussion_id: params[:discussion_id]})
    @comment.user = current_user
    @comment.save
    redirect_back(fallback_location: root_path)
  end

  def delete
    @comment = Comment.find()

  end

  private
  def comment_params 
    params.require(:comment).permit(:body, :discussion_id)
  end
  def set_discussion
    @discussion = Discussion.find(params[:discussion_id])
  end
end
