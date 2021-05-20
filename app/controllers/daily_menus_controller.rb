class DailyMenusController < ApplicationController
  def index
    @current_daily_menu = DailyMenu.order("created_at").last
  end

  def new
    @daily_menu = DailyMenu.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def get_items_by_category(category_id)
    PricingUnit.joins(:daily_menu_item, :course)
      .where(
        "daily_menu_item.daily_menu": @current_daily_menu.id, 
        "courses.category_id": category_id
      ).select("pricing_units.volume, courses.name , daily_menu_item.price")
  end

  helper_method :get_items_by_category

end
