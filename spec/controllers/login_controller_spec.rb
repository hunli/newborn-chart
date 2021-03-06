require 'rails_helper'

RSpec.describe LoginController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #signin" do
    it "returns http success" do
      get :signin
      expect(response).to have_http_status(:success)
    end
  end

end
