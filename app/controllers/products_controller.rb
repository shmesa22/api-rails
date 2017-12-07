class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: product
    else
      render json: { errors: product.errors }, status: 422
    end
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      render json: product
    else
      render json: { errors: product.errors }, status: 422
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy

    head :no_content
  end

  private
    def product_params
      params.require(:product).permit(:title, :description, :price)
    end
end
