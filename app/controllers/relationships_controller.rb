class RelationshipsController < ApplicationController


	def create
		@user = User.find(params[:relationship][:following_id])
		if current_user.follow!(@user)
			@user.create_notification_follow!(current_user)
			flash[:notice] = "フォローしました"
			redirect_to @user
		end
	end

	def destroy
		@user = Relationship.find(params[:id]).following
		if current_user.unfollow!(@user)
			flash[:notice] = "フォローを解除しました"
			redirect_to @user
		end
	end

end
