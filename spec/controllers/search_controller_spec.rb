require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  before(:each) do
    @user = create :user
    sign_in @user
  end

  describe 'GET #musicians' do
    it 'returns 200' do
      get :musicians
      expect(response).to be_successful
    end
  end
end
