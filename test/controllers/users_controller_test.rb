require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test 'should get index' do
    get user_url(@user)
    assert_response :success
  end

  test 'should get show' do
    get user_url(@user)
    assert_response :success
  end

  test 'should get new' do
    get user_url(@user)
    assert_response :success
  end

  test 'post create should work with valid data' do
    assert_difference('User.count', 1) do
      post users_url, params: { user: { firstName: 'ExampleFirst',
                                        lastName: 'ExampleLast',
                                        email: 'user@example.com',
                                        password: 'seg2020',
                                        password_confirmation: 'seg2020' } }
    end
    follow_redirect!
    assert_response :success
  end

  test 'should get edit' do
    get user_url(@user)
    assert_response :success
  end

  test 'delete should remove user' do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end
    assert_redirected_to users_path
  end
end
