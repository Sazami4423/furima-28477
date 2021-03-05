class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @products = Product.new
  end
  

  private

  def product_params
    params.require(:product).permit(:content, :image).merge(user_id: current_user.id)
  end

end
