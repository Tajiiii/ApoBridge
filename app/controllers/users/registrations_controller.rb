class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: %i[update destroy]       #email,password変更、削除できないように

  def check_guest
    if resource.email == 'guest@example.com'
      redirect_to root_path, notice: 'ゲストユーザーの変更・削除できません。'
    end
  end

end