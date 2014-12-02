require 'rails_helper'

RSpec.describe Public::V1::RequestController, :type => :controller do

  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end
  
  describe "GET locations" do
    it "returns http success" do
      get :locations, country_code: 'UK'
      expect(response).to render_template(:locations)
      expect(response).to have_http_status(:success)
    end
    
    it "assigns @locations" do
      get :locations, country_code: 'UK'
      expect(assigns(:locations)).to be_a(Array)
    end
  end

  describe "GET target_groups" do
    it "returns http success" do
      get :target_groups, country_code: 'UK'
      expect(response).to have_http_status(:success)
    end
  end

end
