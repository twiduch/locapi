Rails.application.routes.draw do
  
  namespace :private, defaults: { format: 'json' } do
    namespace :v1 do
      get 'locations/:country_code' => 'request#locations'
      get 'target_groups/:country_code' => 'request#target_groups'
      get 'evaluate_target' => 'request#evaluate_target'
    end
  end

  namespace :public, defaults: { format: 'json' } do
    namespace :v1 do
      get 'locations/:country_code' => 'request#locations'
      get 'target_groups/:country_code' => 'request#target_groups'
    end
  end

end
