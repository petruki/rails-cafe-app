class ProductsController < ApplicationController
  before_action :current_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.create(product_params)

    redirect_to product_path(product)
  end

  def update
    @product.update(product_params)

    redirect_to product_path(@product)
  end

  def destroy
    pu_count = PricingUnit.joins(course_items: [:course])
      .where(product_id: @product.id).count

    pp_count = PricingPortion.joins(course_items: [:course])
      .where(product_id: @product.id).count

    if pu_count + pp_count == 0
      @product.destroy
    end

    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name)
  end

  def current_product
    @product = Product.find(params[:id])
  end
end
