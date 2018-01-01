require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @profile = profiles(:one)
  end

  teardown do
    Rails.cache.clear
  end

  # Create

  test "should create a new product" do
    product = Product.new({"name" => "Test Product", "url" => "http://www.google.com", "progress" => 0.0, "price" => 100.0, "profile_id" => @profile.id})
    assert product.save
  end

  test "should create a new product without an url" do
    product = Product.new({"name" => "Test Product", "progress" => 0.0, "price" => 100.0, "profile_id" => @profile.id})
  end

  test "shouldn't create a new product without a price" do
    product = Product.new({"name" => "Test Product", "url" => "http://www.google.com", "progress" => 0.0, "profile_id" => @profile.id})
    assert_not product.save
  end

  test "shouldn't create a new product with a 0 as a price" do
    product = Product.new({"name" => "Test Product", "url" => "http://www.google.com", "progress" => 0.0, "price" => 0, "profile_id" => @profile.id})
    assert_not product.save
  end

  test "shouldn't create a new product without a profile_id" do
    product = Product.new({"name" => "Test Product", "url" => "http://www.google.com", "progress" => 0.0, "price" => 100.0})
    assert_not product.save
  end

  test "shouldn't create a new product without a name" do
    product = Product.new({"name" => "", "url" => "", "progress" => 0.0, "price" => 100.0, "profile_id" => @profile.id})
    assert_not product.save
  end

  test "shouldn't create a new product with a name length less than 4" do
    product = Product.new({"name" => "aaa", "url" => "", "progress" => 0.0, "price" => 100.0, "profile_id" => @profile.id})
    assert_not product.save
  end

  test "shouldn't create a new product with a name length greater than 255" do
    name = ""
    256.times { name += "a" }
    product = Product.new({"name" => name, "url" => "", "progress" => 0.0, "price" => 100.0, "profile_id" => @profile.id})
    assert_not product.save
  end
end
