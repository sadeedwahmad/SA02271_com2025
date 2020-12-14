require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = profiles(:one)
    @user = users(:one)  #set up to provide user ids and profile ids #used devise digest
  end

  #checks default index
  test "should get index" do
    get profiles_url
    assert_response :success

  end

  #fixed no id error
  test "should get new" do
    get new_profile_url
    assert_response :success
  end
  #fixed errors, creates perfect profile
  test "should create profile" do
    assert_difference('Profile.count') do
      post profiles_url, params: { profile: { email: @profile.email, name: @profile.name, user_id: @user.id } }
    end

    assert_redirected_to profile_url(Profile.last)
  end
  #changed view to support images and works perfectly
  test "should show profile" do
    get profile_url(@profile)
    assert_response :success
  end

  #paperclip changed to meet edit
  test "should get edit" do
    get edit_profile_url(@profile)
    assert_response :success
  end

  #updates passed
  test "should update profile" do
    patch profile_url(@profile), params: { profile: { email: @profile.email, name: @profile.name, user_id: @user.id } }
    assert_redirected_to profile_url(@profile)
  end

  #destroys correctly, works with scope
  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete profile_url(@profile)
    end

    assert_redirected_to profiles_url
  end

  #validated so will not save empty
  test 'should not save empty profile' do
    profile = Profile.new
    profile.save
    refute profile.valid?
  end

  #passes with required values
  test 'should save valid profile' do
    profile = Profile.new
    profile.name = 'Username'
    profile.email = 'Someemail@email.com'
    profile.user_id = @user.id
    profile.save
    assert profile.valid?
  end





end
