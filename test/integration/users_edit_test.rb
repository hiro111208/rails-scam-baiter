require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @admin_user = users(:one)
    @non_admin_user = users(:two)
    @user = User.create(firstName: 'ExampleFirst',
                        lastName: 'ExampleLast',
                        email: 'user@example.com',
                        admin: true,
                        password: 'seg2020',
                        password_confirmation: 'seg2020')
  end

  test 'unsuccessful user edit' do
    sign_in @admin_user
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { firstName: 'ExampleFirst',
                                              lastName: '',
                                              email: 'user@example.com',
                                              admin: true,
                                              password: 'seg2020',
                                              password_confirmation: 'pep2020' } }
    assert_template 'users/edit'
  end

  test 'successful user edit' do
    sign_in @admin_user
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { firstName: 'Example2First',
                                              lastName: 'Example2Last',
                                              email: 'user2@example.com',
                                              admin: true,
                                              password: 'pep2020',
                                              password_confirmation: 'pep2020' } }
    assert_redirected_to @user
  end

  test 'non_admin user edit should fail' do
    sign_in @non_admin_user
    get edit_user_path(@user)
    assert_template nil
  end
end
