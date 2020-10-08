class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
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
  end

  private
  def user_params
    params.require(:user).permit(:name, :company, :phonenumber, :postcode, :address, :email, :user_id)
  end
end
