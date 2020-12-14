require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test 'valid profile' do

    profile = Profile.new(name: 'sadeed', email: 'sadeed@surrey.com', user_id:@user.id)
    assert profile.valid?
  end

  test 'invalid without name' do
    profile = Profile.new(email: 'sadeed@surrey.com',user_id:@user.id)
    refute profile.valid?, 'user is valid without a name'
    assert_not_nil profile.errors[:name], 'no validation error for name present'
  end


  test 'invalid without email' do
    profile = Profile.new(name: 'sadeed',user_id:@user.id)
    refute profile.valid?, 'user is valid without a email'
    assert_not_nil profile.errors[:name], 'no validation error for email present'
  end

  test 'invalid without user' do
    profile = Profile.new(name: 'sadeed',email: 'sadeed@surrey.com')
    refute profile.valid?, 'user is valid without a id'
    assert_not_nil profile.errors[:user_id], 'no validation error for userid present'
  end

end
