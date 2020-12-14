require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_url
    assert_response :success
  end
  #testing url and basic content
  test "should get contact" do
    get contact_url
    assert_response :success
    assert_template layout: 'application'

    assert_select 'h1', 'Contact Us'
    assert_select 'p', 'Complete the form to contact us'
  end

  #uses mailer and function from contact mailer
  test "should post request contact but no email" do
  post request_contact_url
  assert_response :redirect
  assert_not_empty flash[:alert]
  assert_nil flash[:notice]
  end

  #calls function that was defined and passes values
  test "should post request contact" do
    post request_contact_url, params:
        {name: "Matthew", email: "matthew@me.com",
         telephone: "1234567890", message: "Hello"}
    assert_response :redirect
    assert_nil flash[:alert]
    assert_not_empty flash[:notice]
  end



end
