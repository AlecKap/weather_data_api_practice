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
  end
end