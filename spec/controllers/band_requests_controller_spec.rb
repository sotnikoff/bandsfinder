require 'rails_helper'

RSpec.describe BandRequestsController, type: :controller do
  before(:each) do
    @user = create :user
    @musician = Musician.create(user: @user)
    sign_in @user
  end

  let(:band) { create :band }

  describe 'POST #create' do
    it 'returns found after creating' do
      post :create, params: { band_id: band.id }
      expect(response).to have_http_status(:found)
    end
  end

  describe 'POST #approve' do
    it 'returns found after approving' do
      band_request = BandRequest.create(band: band, musician: @musician)
      post :approve, params: { id: band_request.id }
      expect(response).to have_http_status(:found)
    end
  end

  describe 'POST #decline' do
    it 'returns found after declining' do
      band_request = BandRequest.create(band: band, musician: @musician)
      post :decline, params: { id: band_request.id }
      expect(response).to have_http_status(:found)
    end
  end
end
