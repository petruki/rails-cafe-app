class DailyMenusController < ApplicationController
  before_action :load_menu, only: [:index, :show, :edit, :update, :destroy]

  def new
    @daily_menu = DailyMenu.new
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def load_menu
    @current_daily_menu = DailyMenu.order("created_at").last
    @selected_category = params[:category]
  end

  def filter_category(category_id)
    if not @selected_category.nil?
      return helpers.category_in_use(category_id) && @selected_category.to_i == category_id
    end
    helpers.category_in_use(category_id)
  end

  helper_method :filter_category

end
