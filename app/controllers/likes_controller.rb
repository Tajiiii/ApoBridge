class LikesController < ApplicationController
	def create
		@service = Service.find(params[:service_id])
		@like = current_user.likes.new(service_id: @service.id)
		@like.save
		redirect_to service_path(@service)
	end

	def destroy
		@service = Service.find(params[:service_id])
		@like = current_user.likes.find_by(service_id: @service.id)
		@like.destroy
		redirect_to service_path(@service)
	end
end
