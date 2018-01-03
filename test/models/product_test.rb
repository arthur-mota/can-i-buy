require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @profile = profiles(:one)
    @product = products(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test "valid user" do
    assert @product.valid?
  end

  # Create

  test "should create a new product" do
    assert @product.save
  end

  test "should create a new product without an url" do
    @product.url = nil
    assert @product.save
  end

  test "shouldn't create a new product without a price" do
    @product.price = nil
    refute @product.valid?, 'saved product without a price'
    assert_not @product.save
  end

  test "shouldn't create a new product with a 0 as a price" do
    @product.price = 0
    refute @product.valid?, 'saved product with price = 0'
    assert_not @product.save
  end

  test "shouldn't create a new product without a profile_id" do
    @product.profile_id = nil
    refute @product.valid?, 'saved product without profile_id'
    assert_not @product.save
  end

  test "shouldn't create a new product without a name" do
    @product.name = nil
    refute @product.valid?, 'saved product without a name'
    assert_not @product.save
  end

  test "shouldn't create a new product with a name length less than 4" do
    @product.name = "abc"
    refute @product.valid?, 'saved product with name.length < 4'
    assert_not @product.save
  end

  test "shouldn't create a new product with a name length greater than 255" do
    name = ""
    256.times { name += "a" }
    @product.name = name
    refute @product.valid?, 'saved product with name.length > 255'
    assert_not @product.save
  end

  # Update
end
