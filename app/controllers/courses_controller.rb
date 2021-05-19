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

  def update
    @course.update(course_params)

    redirect_to course_path(@course)
  end

  def destroy
    pu_count = PricingUnit.joins(:course).where(course_id: @course.id).count

    if pu_count == 0
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
    params.require(:course).permit(:name, :category_id)
  end

  def current_course
    @course = Course.find(params[:id])

    @pricing_unit = PricingUnit.new
    @pricing_units = Course.joins(:pricing_units)
      .where("pricing_units.course_id": @course.id)
      .select("pricing_units.*")
  end
end
