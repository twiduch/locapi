FactoryGirl.define do
  factory :location do
  end

  factory :location1, parent: :location do
    name "Location 1"
    uuid "abc-1"
  end
  
   factory :location2, parent: :location do
    name "Location 2"
    uuid "abc-2"
  end
  
  factory :location3, parent: :location do
    name "Location 3"
    uuid "abc-3"
  end
end
