# frozen_string_literal: true
require 'test_helper'

class PaymentsFlowTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(firstName: 'ExampleFirst',
                        lastName: 'ExampleLast',
                        email: 'user@example.com',
                        password: 'seg2020',
                        password_confirmation: 'seg2020')

    @user.accounts.create(currency: 0)
  end

  test 'renders right template' do
    sign_in_as_user(@user, 'seg2020')
    get '/payments'
    assert_template 'payments/index'
  end

  test 'unsuccessful payment due to IBAN' do
    sign_in_as_user(@user, 'seg2020')
    post '/payments', params: { user: { firstName: 'Test payment',
                                        amount: '50.50',
                                        country: 'BG',
                                        iban: 'GB000000000' } }

    assert_redirected_to '/payments'
  end

  test 'unsuccessful payment due to insufficient balance' do
    sign_in_as_user(@user, 'seg2020')
    post '/payments', params: { user: { firstName: 'Test payment',
                                        amount: '50.50',
                                        country: 'BG',
                                        iban: 'GB000000000' } }

    assert_redirected_to '/payments'
  end

  test 'successful payment' do
    sign_in_as_user(@user, 'seg2020')
    post '/payments', params: { user: { firstName: 'Test payment',
                                        amount: '50.50',
                                        country: 'GB',
                                        iban: 'GB000000000' } }

    assert_redirected_to '/payments'
  end
end
