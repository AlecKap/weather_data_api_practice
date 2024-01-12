class Weather
  attr_reader :date,
              :temp,
              :humidity,
              :wind_speed

  def initialize(data)
    @date = format_date(data[:ts])
    @temp = to_fer(data[:tp])
    @humidity = data[:hu]
    @wind_speed = wind_speed_conversion(data[:ws])
  end

  def to_fer(temp)
    (temp * 9/5) + 32
  end

  def format_date(dt)
    dt.to_datetime.strftime('%B %d, %Y')
  end

  def wind_speed_conversion(ws)
    (ws * 2.237).to_i
  end
end

