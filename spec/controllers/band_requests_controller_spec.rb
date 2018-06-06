require 'rails_helper'

RSpec.describe BandRequestsController, type: :controller do

  describe "GET #approve" do
    it "returns http success" do
      get :approve
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #decline" do
    it "returns http success" do
      get :decline
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #revoke" do
    it "returns http success" do
      get :revoke
      expect(response).to have_http_status(:success)
    end
  end

end
