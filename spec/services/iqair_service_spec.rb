require "rails_helper"

RSpec.describe IqairService do
  describe 'instance methods' do
    describe '#get_nearest_city_data' do
      it 'returns the nearest city data', :vcr do
        service = IqairService.new.get_nearest_city_data

        expect(service).to be_a(Hash)
        expect(service).to have_key(:status)
        expect(service[:status]).to eq('success')
        expect(service).to have_key(:data)
        expect(service[:data]).to be_a(Hash)
        expect(service[:data]).to have_key(:city)
        expect(service[:data][:city]).to be_a(String)
        expect(service[:data]).to have_key(:state)
        expect(service[:data][:state]).to be_a(String)
        expect(service[:data]).to have_key(:country)
        expect(service[:data][:country]).to be_a(String)
        expect(service[:data]).to have_key(:location)
        expect(service[:data][:location]).to be_a(Hash)
        expect(service[:data][:location]).to have_key(:coordinates)
        expect(service[:data][:location][:coordinates]).to be_a(Array)
        expect(service[:data][:location][:coordinates].count).to eq(2)
        expect(service[:data][:location][:coordinates][0]).to be_a(Float)
        expect(service[:data][:location][:coordinates][1]).to be_a(Float)
        expect(service[:data]).to have_key(:current)
        
        current = service[:data][:current]
        
        expect(current).to be_a(Hash)
        expect(current).to have_key(:weather)
        expect(current[:weather]).to be_a(Hash)
        expect(current[:weather]).to have_key(:ts)
        expect(current[:weather][:ts]).to be_a(String)
        expect(current[:weather]).to have_key(:tp)
        expect(current[:weather][:tp]).to be_a(Integer)
        expect(current[:weather]).to have_key(:pr)
        expect(current[:weather][:pr]).to be_a(Integer)
        expect(current[:weather]).to have_key(:hu)
        expect(current[:weather][:hu]).to be_a(Integer)
        expect(current[:weather]).to have_key(:ws)
        expect(current[:weather][:ws]).to be_a(Float)
        expect(current[:weather]).to have_key(:wd)
        expect(current[:weather][:wd]).to be_a(Integer)
        expect(current[:weather]).to have_key(:ic)
        expect(current[:weather][:ic]).to be_a(String)
      end
    end
  end
end