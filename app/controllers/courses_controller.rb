class CoursesController < ApplicationController
  before_action :current_course, only: [:show, :edit, :update, :destroy, :create_pricing_unit]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end
  
  def create
    course = Course.create(course_params)

    redirect_to course_path(course)
  end
  
  def create_pricing_unit
    pricing_unit = params.require(:pricing_unit).permit(:volume, :unit, :price)
    pricing_unit[:course_id] = params[:id]
    PricingUnit.create(pricing_unit)

    redirect_back(fallback_location: edit_course_path)
  end

  def destroy_pricing_unit
    pricing_unit = PricingUnit.find(params[:id])
    pricing_unit.destroy

    redirect_back(fallback_location: edit_course_path)
  end

  def create_pricing_portion
    pricing_portion = params.require(:pricing_portion).permit(:volume_per_unit, :unit, :quantity, :price)
    pricing_portion[:course_id] = params[:id]
    PricingPortion.create(pricing_portion)

    redirect_back(fallback_location: edit_course_path)
  end

  def destroy_pricing_portion
    pricing_portion = PricingPortion.find(params[:id])
    pricing_portion.destroy

    redirect_back(fallback_location: edit_course_path)
  end

  def update
    @course.update(course_params)

    redirect_to course_path(@course)
  end

  def destroy
    pu_count = PricingUnit.joins(:course).where(course_id: @course.id).count
    pp_count = PricingPortion.joins(:course).where(course_id: @course.id).count

    if pu_count + pp_count == 0
      @course.destroy
    end

    redirect_to courses_path
  end

  def course_category(category_id)
    Category.find(category_id)[:name]
  end

  helper_method :course_category

  private

  def course_params
    params.require(:course).permit(:name)
  end

  def current_course
    @course = Course.find(params[:id])

    @pricing_unit = PricingUnit.new
    @pricing_units = Course.joins(:pricing_units)
      .where("pricing_units.course_id": @course.id)
      .select("pricing_units.*")

    @pricing_portion = PricingPortion.new
    @pricing_portions = Course.joins(:pricing_portion)
      .where("pricing_portion.course_id": @course.id)
      .select("pricing_portion.*")
  end
end
