FactoryGirl.define do
  factory :location_group do
  end

  factory :location_group1, parent: :location_group do 
    name "Location Group 1"
  end

  factory :location_group2, parent: :location_group do 
    name "Location Group 2"
  end
  
end
