class LikesController < ApplicationController
	def create
		@service = Service.find(params[:service_id])
		@like = current_user.likes.new(service_id: @service.id)
		@like.save
		@service = Service.find(params[:service_id])
		@service.create_notification_by(current_user)
		respond_to do |format|
			format.html {redirect_to request.referrer}
			format.js
		end
	end

	def destroy
		@service = Service.find(params[:service_id])
		@like = current_user.likes.find_by(service_id: @service.id)
		@like.destroy
		redirect_to service_path(@service)
	end
end
