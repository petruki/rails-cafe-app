class DailyMenuItemsController < ApplicationController

    def destroy
        menu_item = DailyMenuItem.finds(params[:id])
        menu_item.destroy
    end
  
  end
  