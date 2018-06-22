require 'rails_helper'

RSpec.describe CountriesController, type: :controller do
  before(:each) do
    @country = create :country
    sign_in create :user
  end

  describe 'GET #index' do
    it 'returns http success and opens html' do
      get :index
      expect(response).to be_successful
      expect(response).to render_template('index')
    end

    it 'returns http success and has json format' do
      get :index, params: { format: :json }
      countries = JSON.parse(response.body)
      expect(response).to be_successful
      expect(countries[0]['title']).to eq(@country.title)
      expect(response.headers['Content-Type']).to eq('application/json; charset=utf-8')
    end
  end
end
