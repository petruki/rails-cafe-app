module CategoriesHelper
    def category_in_use(category_id)
        Course.where(category_id: category_id).count > 0
    end
end
