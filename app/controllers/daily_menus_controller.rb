class DailyMenusController < ApplicationController
  before_action :current_daily_menu, only: [:index, :show, :edit, :update, :destroy]

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

  def current_daily_menu
    @current_daily_menu = DailyMenu.order("created_at").last
  end

end
