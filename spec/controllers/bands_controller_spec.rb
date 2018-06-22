require 'rails_helper'

RSpec.describe BandsController, type: :controller do
  let(:band) { create :band }
  let(:genre) { create :genre }
  context 'auth needed' do
    before(:each) do
      @band = create :band
      sign_in @band.user
    end

    describe 'GET #index' do
      it 'returns 200' do
        get :index
        expect(response).to be_successful
      end
    end

    describe 'GET #show' do
      it 'returns 200' do
        get :show, params: { id: @band.id }
        expect(response).to be_successful
      end
    end

    describe 'GET #edit' do
      it 'returns 200' do
        get :edit, params: { id: @band.id }
        expect(response).to be_successful
      end
    end

    describe 'GET #new' do
      it 'returns 200' do
        Musician.create(user: @band.user)
        get :new
        expect(response).to be_successful
      end
    end
  end

  describe 'POST #create' do
    it 'returns :found' do
      musician = create :musician
      sign_in musician.user
      post :create, params: {
        band: {
          title: 'AC/DC',
          description: 'Epic band!',
          genre_id: genre.id
        }
      }
      expect(response).to have_http_status(:found)
    end
  end
end
