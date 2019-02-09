class MostDangerousDayController < ApplicationController
  def index
    @start_date = format_MONTH_D_YYY(params[:start_date])
    @end_date = format_MONTH_D_YYY(params[:end_date])

    @nasa_facade = NasaFacade.new(ENV["NASA_KEY"])
    date_w_asteroids = @nasa_facade.most_dangerous_day(params[:start_date], params[:end_date])
    @most_dangerous_date = format_MONTH_D_YYY(date_w_asteroids[0].to_s)
    @dangerous_asteroids = date_w_asteroids[1]
  end
end
