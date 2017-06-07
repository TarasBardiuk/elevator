# frozen_string_literal: true

module ApplicationHelper
  def admin_name(first_name, last_name)
    ' ' + [first_name, last_name].join(' ')
  end
end
