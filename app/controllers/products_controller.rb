class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index]

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
    params.require(:product).permit(:image, :title, :description_text, :category_id,
                                    :product_status_id, :shipping_fee_id, :prefectures_id, :days_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to  new_user_session_path
    end
  end

end
