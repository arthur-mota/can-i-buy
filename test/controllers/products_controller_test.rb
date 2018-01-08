require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest  
  setup do
    @profile = profiles(:one)
    @product = products(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test "should get products from profile profiles(:one)" do
    get profile_products_url(profiles(:one))
    assert_response :success
  end

  test "should get products from profile profiles(:two)" do
    get profile_products_url(profiles(:two))
    assert_response :success
  end

  test "should be redirected to profiles(:one) because the profile 5555 doesn't exist" do
    get profile_products_url(5555)
    assert_redirected_to profile_products_url(profiles(:one).id)
  end

  test "should delete a product" do
    assert_difference('Product.count', -1) do
      delete profile_product_url(:profile_id => @profile, :id => @product)
    end

    assert_redirected_to profile_products_url
  end

  test "should create a product" do
    assert_difference('Product.count') do
      post profile_products_url(@profile), params: { product: { name: 'Test Product', price: 100.50, url: "http://google.com", profile_id: @profile.id } }
    end

    assert_redirected_to profile_products_path(@profile)
  end

  test "should update a product" do
    put profile_product_url(@profile, @product), params: { progress: 1000, profile_id: @profile.id }
    assert_redirected_to profile_products_path(@profile)
    @product.reload
    assert_equal 1000.0, @product.progress
  end
end
