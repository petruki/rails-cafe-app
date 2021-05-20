class CategoriesController < ApplicationController
  before_action :current_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.create(category_params)

    redirect_to categories_path(category)
  end

  def update
    @category.update(category_params)

    redirect_to categories_path(@category)
  end

  def destroy
    @category.destroy

    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def current_category
    @category = Category.find(params[:id])
  end
end
