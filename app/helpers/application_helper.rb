# frozen_string_literal: true
module ApplicationHelper
  def error_messages_for(object)
    render(partial: 'application/error_messages', locals: {object: object})
  end

  def navigation_bar
    render(partial: 'application/navigation_bar')
  end
end
