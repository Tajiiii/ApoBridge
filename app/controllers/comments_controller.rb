class CommentsController < ApplicationController



  def create
  	@service = Service.find(params[:service_id])
  	@comment = current_user.comments.new(comment_params)
  	@comment.service_id = @service.id
  	@comment.save
    @comment.service.create_notification_comment!(current_user, @comment_id)
  	redirect_to service_path(@service)
  end

  def destroy
  	@service = Service.find(params[:service_id])
  	Comment.find_by(id: params[:id], service_id: params[:service_id]).destroy
  	redirect_to service_path(@service.id)
  end

  private
  def comment_params
  	params.require(:comment).permit(:content).merge(service_id: params[:service_id])
  end
end
