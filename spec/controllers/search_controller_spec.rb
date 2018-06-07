require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET #musicians" do
    it "returns http success" do
      get :musicians
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #bands" do
    it "returns http success" do
      get :bands
      expect(response).to have_http_status(:success)
    end
  end

end
