class LikesController < ApplicationController
	def create
		respond_to do |format|
			format.html {redirect_to request.referrer}
			format.js
		end
		@service = Service.find(params[:service_id])
		@like = current_user.likes.new(service_id: @service.id)
		@like.save
		@service.create_notification_by(current_user)

	end

	def destroy
		@service = Service.find(params[:service_id])
		@like = Like.find_by(user_id: current_user.id, service_id: params[:service_id])
		@like.destroy

	end
end
