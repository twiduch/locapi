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
end
