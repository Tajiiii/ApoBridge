class ServicesController < ApplicationController
  def index
    @like = Like.new(user_id: @current_user_id, service_id: params[:service_id])
    @service = Service.find_by(id: @like.service_id)
    @like_count = Like.where(service_id: params[:service_id]).count
    if params[:name]
      @services = Service.where("name LIKE ?", "%#{params[:name]}%")
    else
      @services = Service.all
    end
  end

  def show
  	@service = Service.find(params[:id])
    @like_count = Like.where(service_id: params[:service_id]).count
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
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      flash[:success] = "情報を更新しました"
      redirect_to service_path(@service)
    else
      render "edit"
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to services_path
  end

  private
  def service_params
  	params.require(:service).permit(:name, :category_id, :area, :price, :introduction, :user_id, :image)
  end
end

