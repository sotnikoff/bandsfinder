require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
  before(:each) do
    @region = create :region
    sign_in create :user
  end

  describe 'GET #index' do
    it 'returns http success and opens html' do
      get :index, params: { country: @region.country.id }
      expect(response).to be_successful
      expect(response).to render_template('index')
    end

    it 'returns http success and has json format' do
      get :index, params: { format: :json, country: @region.country.id }
      region = JSON.parse(response.body)
      expect(response).to be_successful
      expect(region[0]['title']).to eq(@region.title)
      expect(response.headers['Content-Type']).to eq('application/json; charset=utf-8')
    end
  end
end
