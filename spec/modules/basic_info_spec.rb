require 'rails_helper'

describe BasicInfo do 
  include BasicInfo
  let(:params) {instance_double("ActionController::Parameters")}
  before do 
    allow(params).to receive(:[]).with(:country_code).and_return('xy')
  end
  
  it "#country" do 
    expect(params).to receive(:[]).with(:country_code)
    expect(country).to be_nil
  end
  
  it "#locations" do 
    expect(params).to receive(:[]).with(:country_code)
    expect(locations).to eq([])
  end
end
