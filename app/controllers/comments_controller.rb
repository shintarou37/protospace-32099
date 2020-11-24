class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = Comment.new(create_params)
    if @comment.save
    redirect_to "/prototypes/#{@comment.prototype.id}"
    else
      @prototype = Prototype.find(params[:prototype_id])
      @comments = @prototype.comments
      render template: "prototypes/show"
    end
  end

  private
  def create_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
