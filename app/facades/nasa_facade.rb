class NasaFacade
  def initialize(nasa_key, start_date, end_date)
    @nasa_key = nasa_key
  end

  def most_dangerous_day

  end

  private

  def service
    NasaService.new
  end
end
