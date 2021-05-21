module CoursesHelper
    def get_courses_by_category(category_id)
        PricingUnit.joins(
            "INNER JOIN courses ON
                courses.id = pricing_units.course_id
            INNER JOIN categories ON
                categories.id = courses.category_id"
            ).where(
              "courses.category_id": category_id
            ).select("pricing_units.*, courses.name, categories.name as category")
      end
end
