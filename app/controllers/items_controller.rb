class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  
  def index
    @product = Product.all.order(created_at: :desc)
  end

  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    unless current_user.id == @product.user.id
      redirect_to action: :index
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to action: :show
    else
      render :edit
    end
  end
  

  private
  
  def product_params
    params.require(:product).permit(:product_name, :product_explain, :category_id, :product_status_id, :shipping_fee_id, :prefecture_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

end
