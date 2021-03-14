class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:index, :create]
  before_action :user_check, only: [:index]

  def index
    @order = Order.new
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_product
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :prefectures_id, :municipalities, :address, :building_name, :tel, :price).merge(
      product_id: @product.id, token: params[:token], user_id: current_user.id
    )
  end

  def pay_product
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']    # 自身のPAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @product.price, # 商品の値段
      card: order_params[:token],              # カードトークン
      currency: 'jpy'                          # 通貨の種類（日本円）
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def user_check
    redirect_to root_path if @product.user_id == current_user.id || !@product.product_purchase_management.nil?
  end
end
