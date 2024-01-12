require 'rails_helper'

RSpec.describe IqairFacade do
  describe 'instance methods' do
    before :each do
      @facade = IqairFacade.new
    end

    describe '#location_time_date' do
      it 'returns the location, time, and date', :vcr do
        expect(@facade.location_time_date).to eq("Northglenn, Colorado at #{Time.now.strftime('%I:%M %p')} on #{Date.today.strftime('%B %d, %Y')}:")
      end
    end

    describe '#nearest_city_weather' do
      it 'returns the nearest city weather', :vcr do
        expect(@facade.nearest_city_weather).to be_a(Weather)
        expect(@facade.nearest_city_weather.date).to be_a(String)
        expect(@facade.nearest_city_weather.temp).to be_a(Integer)
        expect(@facade.nearest_city_weather.humidity).to be_a(Integer)
        expect(@facade.nearest_city_weather.wind_speed).to be_a(Integer)
      end
    end

    describe '#nearest_city_temp' do
      it 'returns the nearest city temperature', :vcr do
        expect(@facade.nearest_city_temp).to be_a(Integer)
      end
    end

    describe '#nearest_city_humidity' do
      it 'returns the nearest city humidity', :vcr do
        expect(@facade.nearest_city_humidity).to be_a(Integer)
      end
    end

    describe '#nearest_city_wind_speed' do
      it 'returns the nearest city wind speed', :vcr do
        expect(@facade.nearest_city_wind_speed).to be_a(Integer)
      end
    end
  end
end