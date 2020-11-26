# frozen_string_literal: true

class OverviewController < ApplicationController
  before_action :authenticate_user!

  def index
    print('Test overview')

    render 'overview/index'
  end
end
