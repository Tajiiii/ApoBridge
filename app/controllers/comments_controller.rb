class CommentsController < ApplicationController



  def create
  	@service = Service.find(params[:service_id])
  	@comment = current_user.comments.new(comment_params)
  	@comment.service_id = @service.id
  	@comment.save
  	redirect_to service_path(@service)
  end

  def destroy
  	@service = Service.find(params[:service_id])
  	@comment = @service.comments.find(params[:id])
  	if @comment.destroy
  		redirect_to service_path(@service.id)
  	end
  end

  private
  def comment_params
  	params.require(:comment).permit(:content).merge(service_id: params[:service_id])
  end
end
