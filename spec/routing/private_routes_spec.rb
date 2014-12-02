require "rails_helper"

RSpec.describe "private routes" do
  it "routes /private/v1/locations to private controller" do
    expect(get: "/private/v1/locations/uk").
      to route_to(:controller => "private/v1/request", 
                  :action => "locations", 
                  format: "json", 
                  country_code: "uk")
  end
  
  it "routes /private/v1/target_groups to private controller" do
    expect(get: "/private/v1/target_groups/uk").
      to route_to(:controller => "private/v1/request", 
                  :action => "target_groups", 
                  format: "json", 
                  country_code: "uk")
  end
  
  it "routes /private/v1/evaluate_target to private controller" do
    expect(post: "/private/v1/evaluate_target").
      to route_to(:controller => "private/v1/request", 
                  :action => "evaluate_target", 
                  format: "json",)
  end
end
