require 'rails_helper'

RSpec.describe Private::V1::RequestController, :type => :controller do
  render_views
  let(:json) { JSON.parse(response.body) }
  let(:pp1)  {create(:panel_provider1)}
  let(:pp2)  {create(:panel_provider2)}
  let(:pp3)  {create(:panel_provider3)}
  
  let!(:ru)  {create(:country_RU, panel_provider: pp1)}
  let!(:fr)  {create(:country_FR, panel_provider: pp2)}
  let!(:uk)  {create(:country_UK, panel_provider: pp3)}
  
  let!(:tg1) {create(:target_group1, panel_provider: pp2)}
  let!(:tg2) {create(:target_group2)}
  
  let!(:lg1) {create(:location_group1, panel_provider: pp1)}
  let!(:lg2) {create(:location_group2, panel_provider: pp2)}
  
  let!(:loc1){create(:location1)}
  let!(:loc2){create(:location2)}
  let!(:loc3){create(:location3)}
  
  let(:pricing_json_response) {{"prices" => {"country_code_price"=>10, "target_group_price"=>20, "locations_price"=>[{"id"=>13, "price"=>10}, {"id"=>14, "price"=>20}, {"id"=>15, "price"=>30}]}}}
  
  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end
  
  context "good token" do 
    describe "GET locations" do
      it "returns http success" do
        get :locations, country_code: 'ru', token: 'abcd'
        expect(response).to render_template(:locations)
        expect(response).to have_http_status(:success)
      end
      
      it "assigns @locations" do
        get :locations, country_code: 'ru', token: 'abcd'
        expect(assigns(:locations))
      end
    end
  
    describe "GET target_groups" do
      it "returns http success" do
        get :target_groups, country_code: 'ru', token: 'abcd'
        expect(response).to have_http_status(:success)
      end
    end
    
    describe "POST evaluate_target" do
      it "returns http success" do
        post :evaluate_target, token: 'abcd'
        expect(response).to have_http_status(:success)
      end
      
      it "returns price for country, target_group, locations" do
        tg1.children << tg2
        
        ru.locations << loc1
        fr.locations << loc2
        uk.locations << loc3
        
        price_evaluator = object_double(PriceEvaluatorService.new(1),
                          country_code_price: 10, 
                          target_group_price: 20,
                          locations_price: [{id: loc1.id, price: 10},
                                            {id: loc2.id, price: 20},
                                            {id: loc3.id, price: 30}])
                                            
        allow(controller).to receive(:price_evaluator).and_return(price_evaluator)
        
        post :evaluate_target, token: 'abcd', country_code: 'ru', 
                               target_group_id: tg2.id, 
                               locations: [ { id: loc1.id, panel_size: 200 },
                                             { id: loc2.id, panel_size: 200 },
                                             { id: loc3.id, panel_size: 300 }]
        expect(json).to eq(pricing_json_response)
      end
      
    end
  end
  
  context "bad token" do
    describe "GET target_groups" do
      it "returns http unauthorized with bad token" do
        get :target_groups, country_code: 'UK', token: 'lll'
        expect(response).to have_http_status(:unauthorized)
        expect(json).to eq({"error"=>"Not Authorized"})
      end
    end
    
    describe "POST evaluate_target" do
      it "returns http success" do
        post :evaluate_target, token: 'bbc'
        expect(response).to have_http_status(:unauthorized)
        expect(json).to eq({"error"=>"Not Authorized"})
      end
    end
  end
  
  context "no token" do 
    describe "GET target_groups" do
      it "returns http unauthorized with no token" do
        get :target_groups, country_code: 'UK'
        expect(response).to have_http_status(:unauthorized)
        expect(json).to eq({"error"=>"Not Authorized"})
      end
    end
    
    describe "POST evaluate_target" do
      it "returns http success" do
        post :evaluate_target
        expect(response).to have_http_status(:unauthorized)
        expect(json).to eq({"error"=>"Not Authorized"})
      end
    end
  end
end
