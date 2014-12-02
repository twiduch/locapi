FactoryGirl.define do
  factory :panel_provider do
  end
  
  factory :panel_provider1, parent: :panel_provider do 
    code 10
    pricing :letter_count
  end

  factory :panel_provider2, parent: :panel_provider do 
    code 20
    pricing :tag_count
  end
  
  factory :panel_provider3, parent: :panel_provider do 
    code 30
    pricing :node_count
  end
  
end
