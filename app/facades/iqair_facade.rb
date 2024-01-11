class IqairFacade
  # def intialize; end
  
  def location_time_date
    "#{nearest_city_data[:data][:city]}, #{nearest_city_data[:data][:state]} at #{Time.now.strftime('%I:%M %p')} on #{Date.today.strftime('%B %d, %Y')}:"
  end

  private

  def service
    @_iqair_service ||= IqairService.new
  end

  def nearest_city_data
    @_get_nearest_city_data ||= service.get_nearest_city_data
  end
end