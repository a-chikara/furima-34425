class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @product = Product.all
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

  private
  
  def product_params
    params.require(:product).permit(:product_name, :product_explain, :category_id, :product_status_id, :shipping_fee_id, :prefecture_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

end