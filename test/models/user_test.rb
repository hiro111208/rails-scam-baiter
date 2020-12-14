require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(firstName: 'ExampleFirst',
                     lastName: 'ExampleLast',
                     email: 'user@example.com',
                     admin: true,
                     password: 'seg2020',
                     password_confirmation: 'seg2020')
  end

  test 'user should be valid' do
    assert @user.valid?
  end

  test 'firstName should be present' do
    @user.firstName = ' '
    assert_not @user.valid?
  end

  test 'lastName should be present' do
    @user.lastName = ' '
    assert_not @user.valid?
  end

  test 'password should be present' do
    @user.password = @user.password_confirmation = ' '
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = ' '
    assert_not @user.valid?
  end

  test 'admin should be present' do
    @user.admin = nil
    assert_not @user.valid?
  end

  test 'firstName should not be too long' do
    @user.firstName = 'a' * 51
    assert_not @user.valid?
  end

  test 'lastName should not be too long' do
    @user.lastName = 'a' * 51
    assert_not @user.valid?
  end

  test 'email should contain @' do
    @user.email = 'a' * 20
    assert_not @user.valid?
  end

  test 'password should have a minimum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end
end
