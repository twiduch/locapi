require 'rails_helper'

RSpec.describe Country, :type => :model do
  let!(:pp1) {create(:panel_provider1)}
  let!(:ru)  {create(:country_RU, panel_provider: pp1)}
  let!(:fr)  {create(:country_FR, panel_provider: pp1)}
  let!(:lg1) {create(:location_group1, panel_provider: pp1)}
  let!(:lg2) {create(:location_group2, panel_provider: pp1)}
  let!(:tg1) {create(:target_group1, panel_provider: pp1)}
  let!(:tg2) {create(:target_group2, panel_provider: pp1)}
  let!(:loc1){create(:location1)}
  let!(:loc2){create(:location2)}
  
  it "should reference PanelProvider" do 
    expect(ru.panel_provider).to be_a(PanelProvider)
  end
  
  it "should reference location groups through panel provider" do 
    expect(ru.location_groups).to include(lg1, lg2)
    expect(fr.location_groups).to include(lg1, lg2)
  end
  
  it "should reference locations through location groups" do 
    lg1.locations << loc1
    lg1.locations << loc2
    lg2.locations << loc1

    expect(ru.locations_in_groups).to include(loc1, loc2)
    expect(ru.locations_in_groups.count).to eq 2
    
    expect(fr.locations_in_groups).to include(loc1, loc2)
    expect(fr.locations_in_groups.count).to eq 2
  end
  
  it "should reference locations directly" do 
    ru.locations << loc1
    ru.locations << loc2
    fr.locations << loc1

    expect(ru.locations).to include(loc2)
    expect(ru.locations.count).to eq 1
    
    expect(fr.locations).to include(loc1)
    expect(fr.locations.count).to eq 1
    
    ru.locations << loc1
    expect(ru.locations).to include(loc1, loc2)
    expect(ru.locations.count).to eq 2
  end
  
  it "should reference target groups through panel provider" do 
    expect(ru.target_groups).to include(tg1, tg2)
    expect(fr.target_groups).to include(tg1, tg2)
  end
end
