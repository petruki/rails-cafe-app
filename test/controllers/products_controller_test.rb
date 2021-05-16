require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_path
    assert_response :success
  end

  test "should delete a product - Can Delete" do
    product = products(:three)
    
    assert_difference("Product.count", -1) do
      delete product_url(product)
    end

    assert_redirected_to products_path

    # Validate DB
    p_unit = PricingUnit.where(product_id: product.id).count
    assert p_unit == 0
  end

  test "should not delete a product - Reason: associated to a course" do
    product = products(:one)
    
    assert_difference("Product.count", 0) do
      delete product_url(product)
    end

    assert_redirected_to products_path
  end
end
