require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should create a new profile" do
    profile = Profile.new({"profile_name" => "Profile Haha"})
    assert profile.save
  end

  test "shouldn't create a new profile without any parameters" do
    profile = Profile.new
    assert_not profile.save
  end

  test "shouldn't create a new profile with blank name" do
    profile = Profile.new({"profile_name" => ""})
    assert_not profile.save
  end
end
