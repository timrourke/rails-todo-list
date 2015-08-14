class HomeController < ApplicationController

  before_filter :authorize

  def index
  	@products = Product.all
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.create(product_params)

  	redirect_to '/'
  end

  def edit
  	@product = Product.find(params[:id].to_i)
  end

  def update
  	@product = Product.find(params[:product][:id].to_i)
  	@product.update(product_params)

  	redirect_to '/'
  end

  def delete
  	@product = Product.find(params[:product][:id].to_i).destroy

  	redirect_to '/'
  end

  private

    def product_params
      params.require(:product).permit(:name, :quantity)
    end
end
