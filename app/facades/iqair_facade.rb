class IqairFacade
  def intialize
    
  end
  
  def location_time_date
    "#{nearest_city_data[:data][:city]}, #{nearest_city_data[:data][:state]} at #{Time.now.strftime('%I:%M %p')} on #{Date.today.strftime('%B %d, %Y')}:"
  end

  def nearest_city_weather
    Weather.new(nearest_city_data[:data][:current][:weather])
  end

  def nearest_city_temp
    nearest_city_weather.temp
  end

  def nearest_city_humidity
    nearest_city_weather.humidity
  end

  def nearest_city_wind_speed
    nearest_city_weather.wind_speed
  end
  
  private

  def service
    @_iqair_service ||= IqairService.new
  end

  def nearest_city_data
    @_get_nearest_city_data ||= service.get_nearest_city_data
  end

  def city_data(city, state, country)
    @_get_city_data ||= service.get_city_data(city, state, country)
  end
end