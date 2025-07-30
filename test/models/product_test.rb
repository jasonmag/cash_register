require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save product without name and price" do
    product = Product.new
    assert_not product.save
  end

  test "should save product with valid name and price" do
    product = Product.new(name: "Test", price: 9.09)
    assert product.save
  end
end
