class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :user_check, only: [:edit, :update]

  def index
    @products = Product.includes(:user).order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def show
  end

  def edit
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  def update
     if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
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

  def set_product
    @product = Product.find(params[:id])
  end

  def user_check
    if @product.user.id != current_user.id 
      redirect_to root_path 
    end  
  end
end
