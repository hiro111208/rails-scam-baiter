require 'test_helper'

class PaymentsFlowTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(firstName: 'ExampleFirst',
                        lastName: 'ExampleLast',
                        email: 'user@example.com',
                        password: 'seg2020',
                        password_confirmation: 'seg2020')
  end

  test 'renders right template' do
    sign_in_as_user(@user, 'seg2020')
    get '/payments'
    assert_template 'payments/index'
  end

  test 'unsuccessful payment due to IBAN' do

  end
end
