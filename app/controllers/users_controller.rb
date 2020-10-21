class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @services = current_user.services.page(params[:page]).per(5)
    @likes = Like.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "登録情報を更新しました"
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  def unsubscribe
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def following
    @user = User.find(params[:id])
    @users = @user.followings.page(params[:page]).per(10)
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(10)
    render 'show_follower'
  end

  private
  def user_params
    params.require(:user).permit(:name, :company, :phonenumber, :postcode, :address, :email, :image)
  end
end
