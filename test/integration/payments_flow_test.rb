# frozen_string_literal: true

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
    @user.accounts.create(currency: 0)
    get '/payments'
    assert_template 'payments/index'
  end

  test 'unsuccessful payment due to IBAN' do
    sign_in_as_user(@user, 'seg2020')

    @user.accounts.create(currency: 0)
    post '/payments', params: { firstName: 'Test payment',
                                amount: '50.50',
                                country: 'BG',
                                iban: 'GB000000000' }

    assert_redirected_to '/payments'
    assert_equal 'Payment is not possible. IBAN is invalid', flash[:error]
  end

  test 'unsuccessful payment due to insufficient balance' do
    sign_in_as_user(@user, 'seg2020')
    @user.accounts.create(currency: 0)
    post '/payments', params: { firstName: 'Test payment',
                                amount: '50.50',
                                country: 'GB',
                                iban: 'GB000000000' }

    assert_redirected_to '/payments'
    assert_equal "Payment is not possible. Balance can't be less than 0", flash[:error]
  end

  test 'successful payment' do
    sign_in_as_user(@user, 'seg2020')
    @user.accounts.create(currency: 0, balance: 60)
    post '/payments', params: { firstName: 'Test payment',
                                amount: '50.50',
                                country: 'GB',
                                iban: 'GB000000000' }

    assert_redirected_to '/payments'
    assert_equal 'Payment processed.', flash[:success]
  end
end
