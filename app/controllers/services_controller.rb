class ServicesController < ApplicationController
  def login_check
    unless user_signed_in?
       flash[:alert] = "ログインしてください"
       redirect_to services_path
    end
  end
  before_action :login_check, only: [:new, :edit, :update, :destroy, :show]


  def index
    @like = Like.new(user_id: @current_user_id, service_id: params[:service_id])
    @service = Service.find_by(id: @like.service_id)
    @like_count = Like.where(service_id: params[:service_id]).count
    if params[:name]
      #検索機能（入力した文字列に部分一致するデータ検索）
      @services = Service.where("name LIKE ?", "%#{params[:name]}%")
      @services = @services.page(params[:page]).per(9)
    else
      @services = Service.all.page(params[:page]).per(9)
    end
    @categories = Category.all
  end

  def show
  	@service = Service.find(params[:id])
    @like_count = Like.where(service_id: params[:service_id]).count
    @comment = Comment.new
    @comments = @service.comments.all.page(params[:page]).per(5)
  end

  def new
  	@service = Service.new
  end

  def create
  	@service = Service.new(service_params)
    @service.user_id = current_user.id

  	if @service.save
    	flash[:notice] = "サービスを登録しました"
    	redirect_to service_path(@service)
    else
      flash[:notice] = "登録に失敗しました。再度お試しください"
      render "new"
    end

  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      flash[:notice] = "投稿内容を更新しました"
      redirect_to service_path(@service)
    else
      flash[:notice] = "更新に失敗しました。再度お試しください"
      render "edit"
    end
  end

  def destroy
    @service = Service.find(params[:id])
    if @service.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to services_path
    end
  end

  private
  def service_params
  	params.require(:service).permit(:name, :category_id, :area, :price, :introduction, :user_id, :image)
  end
end

