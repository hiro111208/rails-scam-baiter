require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin_user = users(:one)
    @non_admin_user = users(:two)
    @user = users(:three)
  end

  teardown do
    Rails.cache.clear
  end

  test 'should get index' do
    sign_in @admin_user
    get user_url(@user)
    assert_response :success
  end

  test 'non_admin should not get index' do
    sign_in @non_admin_user
    get user_url(@user)
    assert_redirected_to root_path
  end

  test 'should get show' do
    sign_in @admin_user
    get user_url(@user)
    assert_response :success
  end

  test 'non_admin should not get show' do
    sign_in @non_admin_user
    get user_url(@user)
    assert_redirected_to root_path
  end

  test 'should get new' do
    sign_in @admin_user
    get new_user_url(@user)
    assert_response :success
  end

  test 'non_admimn should not get new' do
    sign_in @non_admin_user
    get new_user_url(@user)
    assert_redirected_to root_path
  end

  test 'post create should work with valid data' do
    sign_in @admin_user
    assert_difference('User.count', 1) do
      post users_url, params: { user: { firstName: 'ExampleFirst',
                                        lastName: 'ExampleLast',
                                        email: 'user@example.com',
                                        admin: true,
                                        password: 'seg2020',
                                        password_confirmation: 'seg2020' } }
    end
    follow_redirect!
    assert_response :success
  end

  test 'non_admin post create should not work with valid data' do
    sign_in @non_admin_user
    assert_no_difference('User.count') do
      post users_url, params: { user: { firstName: 'ExampleFirst',
                                        lastName: 'ExampleLast',
                                        email: 'user@example.com',
                                        admin: true,
                                        password: 'seg2020',
                                        password_confirmation: 'seg2020' } }
    end
    assert_redirected_to root_path
  end

  test 'should get edit' do
    sign_in @admin_user
    get edit_user_url(@user)
    assert_response :success
  end

  test 'non_admin should not get edit' do
    sign_in @non_admin_user
    get edit_user_url(@user)
    assert_redirected_to root_path
  end

  test 'delete should remove user' do
    sign_in @admin_user
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end
    assert_redirected_to users_path
  end

  test 'non_admin delete should not remove user' do
    sign_in @non_admin_user
    assert_no_difference('User.count') do
      delete user_url(@user)
    end
    assert_redirected_to root_path
  end
end
