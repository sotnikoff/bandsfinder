require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  before(:each) do
    @user = create :user
    sign_in @user
  end

  describe 'GET #show' do
    it 'returns 200' do
      get :show, params: { id: @user.id }
      expect(response).to be_successful
    end
  end
end
