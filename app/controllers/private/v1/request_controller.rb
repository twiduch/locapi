class Private::V1::RequestController < Private::ApplicationController
  include BasicInfo
  
  def evaluate_target
    @country_code_price = price_evaluator.country_code_price
    @target_group_price = price_evaluator.target_group_price
    @locations_price = price_evaluator.locations_price
  end
  
  
  def price_evaluator
    PriceEvaluatorService.new(params)
  end
end
