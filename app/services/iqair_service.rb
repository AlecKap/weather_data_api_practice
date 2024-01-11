class IqairService
  def get_nearest_city_data
    get_url('nearest_city')
  end

  private

  def conn
    Faraday.new(url: 'https://api.airvisual.com/v2/') do |f|
      f.params['key'] = ENV['IQAIR_API_KEY']  
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end