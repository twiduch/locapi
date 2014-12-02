FactoryGirl.define do
  factory :panel_provider do
  end
  
  factory :panel_provider1, parent: :panel_provider do 
    code 1
  end

  factory :panel_provider2, parent: :panel_provider do 
    code 2
  end
  
end
