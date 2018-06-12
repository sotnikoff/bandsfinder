require 'rails_helper'

RSpec.describe MusiciansController, type: :controller do
  before(:each) do
    @user = create :user
    sign_in @user
  end

  let(:musician) do
    musician = Musician.create(user: @user)
    musician
  end

  describe 'GET #show' do
    it 'returns 200' do
      get :show, params: { id: musician }
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns 200' do
      get :edit, params: { id: musician }
      expect(response).to be_successful
    end
  end

  describe 'DELETE #destroy' do
    it 'returns :found' do
      musician
      delete :destroy
      expect(response).to have_http_status(:found)
    end
  end
end
