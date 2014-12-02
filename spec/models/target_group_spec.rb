require 'rails_helper'

RSpec.describe TargetGroup, :type => :model do
  let!(:pp1) {create(:panel_provider1)}
  let!(:uk)  {create(:country_UK, panel_provider: pp1)}
  let!(:fr)  {create(:country_FR, panel_provider: pp1)}
  let!(:tg1) {create(:target_group1, panel_provider: pp1)}
  let!(:tg2) {create(:target_group2, panel_provider: pp1)}  
  
  it "should reference PanelProvider" do 
    expect(tg1.panel_provider).to be_a(PanelProvider)
  end
  
  it "should reference countries through panel provider" do 
    expect(tg2.countries).to include(uk, fr)
    expect(tg1.countries).to include(uk, fr)
  end
  
end
