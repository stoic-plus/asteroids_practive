class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def format_MONTH_D_YYY(time_string)
    year, month, day = time_string.split("-")
    Time.new(year, month, day).strftime('%B%e, %Y')
  end
end
