FactoryGirl.define do
  factory :country do
  end
  
  factory :country_RU, parent: :country do 
    country_code "RU"
  end

  factory :country_FR, parent: :country do 
    country_code "FR"
  end
  
  factory :country_UK, parent: :country do 
    country_code "UK"
  end
  
end
