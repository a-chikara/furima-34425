class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only:[:index,:create]
  before_action :set_move, only:[:index, :create]

  def index
    @personal_date_record = PersonalDateRecord.new
  end

  def create
    @personal_date_record = PersonalDateRecord.new(record_params)
    if @personal_date_record.valid?
      pay_product
      @personal_date_record.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def record_params
    params.require(:personal_date_record).permit(:postal_code, :prefecture_id, :city, :address, :phone_number, :building).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_move
    if (@product.user_id == current_user.id) && @product.record.nil?
      redirect_to root_path
    end
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,  # 商品の値段
      card: record_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
