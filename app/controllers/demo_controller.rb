# frozen_string_literal: true

class DemoController < ApplicationController
  def index
    # render('demo/hello')
  end

  def hello
    @array = [1, 2, 3, 4]
    @id = params['id']
    @page = params[:page]
  end

  def about
    render('demo/about_us')
  end

  def contact
    country = params[:country].to_s
    @phone_number = if country.casecmp('US').zero? || country.casecmp('CA').zero?
                      '(800) 555-6789'
                    elsif country.casecmp('UK').zero?
                      '(020) 7946 1234'
                    else
                      '1321312312'
                    end
    render('demo/contact_us')
  end
end
