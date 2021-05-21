module DailyMenusHelper
    def get_items_by_category(daily_menu_id, category_id)
        PricingUnit.joins(:daily_menu_item, :course)
          .where(
            "daily_menu_item.daily_menu": daily_menu_id, 
            "courses.category_id": category_id
          ).select("pricing_units.*, courses.name , daily_menu_item.*")
    end
end
