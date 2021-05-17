class ProductsController < ApplicationController
  before_action :current_product, only: [:show, :edit, :update, :destroy, :create_pricing_unit]

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
  
  def create_pricing_unit
    pricing_unit = params.require(:pricing_unit).permit(:volume, :unit, :price)
    pricing_unit[:product_id] = params[:id]
    PricingUnit.create(pricing_unit)

    redirect_back(fallback_location: edit_product_path)
  end

  def destroy_pricing_unit
    pricing_unit = PricingUnit.find(params[:id])
    pricing_unit.destroy

    redirect_back(fallback_location: edit_product_path)
  end

  def create_pricing_portion
    pricing_portion = params.require(:pricing_portion).permit(:volume_per_unit, :unit, :quantity, :price)
    pricing_portion[:product_id] = params[:id]
    PricingPortion.create(pricing_portion)

    redirect_back(fallback_location: edit_product_path)
  end

  def destroy_pricing_portion
    pricing_portion = PricingPortion.find(params[:id])
    pricing_portion.destroy

    redirect_back(fallback_location: edit_product_path)
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

    @pricing_unit = PricingUnit.new
    @pricing_units = Product.joins(:pricing_units)
    .where("pricing_units.product_id": @product.id)
    .select("pricing_units.*")

    @pricing_portion = PricingPortion.new
    @pricing_portions = Product.joins(:pricing_portion)
      .where("pricing_portion.product_id": @product.id)
      .select("pricing_portion.*")
  end

end
