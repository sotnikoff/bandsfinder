require 'rails_helper'

RSpec.describe CitiesController, type: :controller do
  before(:each) do
    @city = create :city
    sign_in create :user
  end

  describe 'GET #index' do
    it 'returns http success and opens html' do
      get :index, params: { region: @city.region.id }
      expect(response).to be_successful
      expect(response).to render_template('index')
    end

    it 'returns http success and has json format' do
      get :index, params: { format: :json, region: @city.region.id }
      city = JSON.parse(response.body)
      expect(response).to be_successful
      expect(city[0]['title']).to eq(@city.title)
      expect(response.headers['Content-Type']).to eq('application/json; charset=utf-8')
    end
  end
end
