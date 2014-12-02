require 'rails_helper'

RSpec.describe Private::V1::RequestController, :type => :controller do

  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end
  
  describe "GET locations" do
    it "returns http success" do
      get :locations, country_code: 'UK', token: 'abcd'
      expect(response).to render_template(:locations)
      expect(response).to have_http_status(:success)
    end
    
    it "assigns @locations" do
      get :locations, country_code: 'UK', token: 'abcd'
      expect(assigns(:locations)).to be_a(Array)
    end
  end

  describe "GET target_groups" do
    it "returns http success" do
      get :target_groups, country_code: 'UK', token: 'abcd'
      expect(response).to have_http_status(:success)
    end
  end

  context "bad token" do
    describe "GET target_groups" do
      it "returns http unauthorized with no token" do
        get :target_groups, country_code: 'UK'
        expect(response).to have_http_status(:unauthorized)
        expect(response.body).to eq("{\"error\":\"Not Authorized\"}")
      end
      
      it "returns http unauthorized with bad token" do
        get :target_groups, country_code: 'UK', token: 'lll'
        expect(response).to have_http_status(:unauthorized)
        expect(response.body).to eq("{\"error\":\"Not Authorized\"}")
      end
    end
  end
end
