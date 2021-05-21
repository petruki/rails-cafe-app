class DailyMenuItemsController < ApplicationController

    def edit
        @daily_menu_item = DailyMenuItem.new
        @current_daily_menu = params[:menu]
        @items = helpers.get_courses_by_category(params[:category])
        @category = Category.find(params[:category])
    end

    def destroy
        menu_item = DailyMenuItem.find(params[:id])
        menu_item.destroy
        
        redirect_back(fallback_location: edit_daily_menu_path)
    end

    def add
        pricing = PricingUnit.find(params[:item_id])
        DailyMenuItem.create(
            daily_menu_id: params[:menu],
            pricing_unit_id: pricing.id,
            price: pricing.price
        )

        redirect_to edit_daily_menu_path(params[:menu])
    end  
  
  end
  