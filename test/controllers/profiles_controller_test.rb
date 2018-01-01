require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = profiles(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test "should get index" do
    get profiles_path
    assert_response :success
  end

  test "should create a profile" do
    assert_difference('Profile.count') do
      post profiles_url, params: { profile: { profile_name: 'Profile 3' } }
    end

    assert_redirected_to profile_products_path(Profile.last)
  end

  test "should delete a profile" do
    assert_difference('Profile.count', -1) do
      delete profile_url(@profile)
    end

    assert_redirected_to root_url
  end

  test "should update a profile" do
    patch profile_url(@profile), params: { profile: { profile_name: 'aupdated'}}
    assert_redirected_to profile_products_path(@profile)
    @profile.reload
    assert_equal "aupdated", @profile.profile_name
  end
end
