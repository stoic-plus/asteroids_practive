class MostDangerousDayController < ApplicationController
  def index
    @start_date = format_time(params[:start_date])
    @end_date = format_time(params[:end_date])
  end

  private

  def format_time(time_string)
    year, month, day = time_string.split("-")
    Time.new(year, month, day).strftime('%B%e, %Y')
  end
end
