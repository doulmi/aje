require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path

    get about_url
    assert_select "title", full_title("About")

    get help_url
    assert_select "title", full_title("Help")

    get contact_url
    assert_select "title", full_title("Contact")

    get signup_url
    assert_select "title", full_title( "Sign up")
  end
end
