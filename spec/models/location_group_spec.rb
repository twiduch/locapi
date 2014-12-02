require 'rails_helper'

RSpec.describe LocationGroup, :type => :model do
  let!(:pp1) {create(:panel_provider1)}
  let!(:uk)  {create(:country_UK, panel_provider: pp1)}
  let!(:fr)  {create(:country_FR, panel_provider: pp1)}
  let!(:lg1) {create(:location_group1, panel_provider: pp1)}
  let!(:lg2) {create(:location_group2, panel_provider: pp1)}
  let!(:loc1){create(:location1)}
  let!(:loc2){create(:location2)}
  
  it "should reference PanelProvider" do 
    expect(lg1.panel_provider).to be_a(PanelProvider)
  end
  
  it "should reference countries through panel provider" do 
    expect(lg2.countries).to include(uk, fr)
    expect(lg1.countries).to include(uk, fr)
  end
  
  it "should reference locations" do 
    lg1.locations << loc1
    loc2.location_groups << lg1
    expect(lg1.locations).to include(loc1, loc2)
  end
end
