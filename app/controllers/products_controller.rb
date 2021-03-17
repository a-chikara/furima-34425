class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_branch, only: [:edit, :update, :destroy]
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
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to action: :show
    else
      render :edit
    end
  end
  def destroy
    if @product.destroy
      redirect_to action: :index
    end
  end
  

  private
  
  def product_params
    params.require(:product).permit(:product_name, :product_explain, :category_id, :product_status_id, :shipping_fee_id, :prefecture_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_branch
    if current_user.id != @product.user.id || @product.record.present?
      redirect_to action: :index
    end
  end
end
