require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(firstName: 'ExampleFirst',
                        lastName: 'ExampleLast',
                        email: 'user@example.com',
                        password: 'seg2020',
                        password_confirmation: 'seg2020')
  end

  test 'unsuccessful edit' do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { firstName: 'ExampleFirst',
                                              lastName: '',
                                              email: 'user@example.com',
                                              password: 'seg2020',
                                              password_confirmation: 'pep2020' } }
    assert_template 'users/edit'
  end

  test 'successful edit' do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { firstName: 'Example2First',
                                              lastName: 'Example2Last',
                                              email: 'user2@example.com',
                                              password: 'pep2020',
                                              password_confirmation: 'pep2020' } }
    assert_redirected_to @user
  end
end
