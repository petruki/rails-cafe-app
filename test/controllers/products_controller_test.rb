require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_path
    assert_response :success
  end

  test "should delete a product - Can Delete" do
    product = products(:can_delete)
    
    assert_difference("Product.count", -1) do
      delete product_url(product)
    end

    assert_redirected_to products_path

    # Validate DB
    p_unit = PricingUnit.where(product_id: product.id).count
    assert p_unit == 0
  end

  test "should not delete a product - Reason: associated to a course" do
    product = products(:spaghetti)
    
    assert_difference("Product.count", 0) do
      delete product_url(product)
    end

    assert_redirected_to products_path
  end

  test "should create a product" do
    assert_difference("Product.count", +1) do
      post "/products", params: { product: { name: "New Product" } }
    end

    # Validate DB
    assert Product.where(name: "New Product").count == 1
  end

  test "should edit a product" do
    product = products(:spaghetti)
    assert_difference("Product.where(name: 'Edited Product').count", 1) do
      patch "/products/#{product.id}", params: { product: { name: "Edited Product" } }
    end
  end
end
