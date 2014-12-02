require 'rails_helper'

RSpec.describe BasePricing, :type => :model do
  let(:bp) {BasePricing.new}
  
  it "should return price as number of elements / 100" do 
    allow(bp).to receive(:number_of_elements).and_return(344)
    expect(bp.price).to eq 3.44
  end
  
  it "should return price 0" do 
    allow(bp).to receive(:number_of_elements).and_return(0)
    expect(bp.price).to eq 0
  end
end
