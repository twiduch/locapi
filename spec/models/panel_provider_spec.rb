require 'rails_helper'

RSpec.describe PanelProvider, :type => :model do
  let(:pp1) {create(:panel_provider1)}
  
  it "should not create panel_provider with the same code" do 
    new_pp = pp1.dup
    expect(new_pp).not_to be_valid
  end
  
end
