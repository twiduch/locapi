require "rails_helper"

RSpec.describe "public routes" do
  it "routes /public/v1/locations to public controller" do
    expect(get: "/public/v1/locations/uk").
      to route_to(:controller => "public/v1/request", 
                  :action => "locations", 
                  format: "json", 
                  country_code: "uk")
  end
  
  it "routes /public/v1/target_groups to public controller" do
    expect(get: "/public/v1/target_groups/uk").
      to route_to(:controller => "public/v1/request", 
                  :action => "target_groups", 
                  format: "json", 
                  country_code: "uk")
  end
  
  it "does not route /public/v1/evaluate_target to public controller" do
    expect(post: "/public/v1/evaluate_target").not_to be_routable
  end
end
