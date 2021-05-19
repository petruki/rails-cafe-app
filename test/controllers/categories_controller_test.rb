require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get categories_path
    assert_response :success
  end

  test "should delete a category - Can Delete" do
    category = categories(:can_delete)
    
    assert_difference("Category.count", -1) do
      delete category_url(category)
    end

    assert_redirected_to categories_path
  end

  test "should create a category" do
    assert_difference("Category.count", +1) do
      post "/categories", params: { category: { name: "New category" } }
    end

    # Validate DB
    assert Category.where(name: "New category").count == 1
  end

  test "should edit a category" do
    category = categories(:main_courses)
    assert_difference("Category.where(name: 'Edited category').count", 1) do
      patch "/categories/#{category.id}", params: { category: { name: "Edited category" } }
    end
  end
end
