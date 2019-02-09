class NasaFacade
  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def most_dangerous_day
    
  end

  private

  def service
    NasaService.new
  end
end
