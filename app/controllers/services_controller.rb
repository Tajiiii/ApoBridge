class ServicesController < ApplicationController
  def index
  	@services = Service.all

  end

  def show
  	@service = Service.find(params[:id])
  end

  def new
  	@service = Service.new
  end

  def create
  	@service = Service.new(service_params)
    @service.user_id = current_user.id

  	if @service.save
    	flash[:success] = "サービスを登録しました"
    	redirect_to service_path(@service)
    else
      render "new"
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def service_params
  	params.require(:service).permit(:name, :category_id, :area, :price, :introduction, :user_id)
  end
end

