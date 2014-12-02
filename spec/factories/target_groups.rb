FactoryGirl.define do
  factory :target_group do
  end

  factory :target_group1, parent: :target_group do 
    name "Target Group 1"
    uuid "trgs-1"
  end
  
  factory :target_group2, parent: :target_group do 
    name "Target Group 2"
    uuid "trgs-2"
  end
end
