require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @profile = profiles(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test "should create a new profile" do
    assert @profile.save
  end

  test "shouldn't create a new profile without a name" do
    @profile.profile_name = nil
    refute @profile.valid?, 'saved profile without a name'
    assert_not @profile.save
  end
end
