class PriceEvaluatorService < Struct.new(:params)
  include BasicInfo
  
  def country_code_price
    return unless params[:country_code]
    country.try(:panel_provider).try(:price)
  end
  
  def target_group_price
    return unless params[:target_group_id]
    tg = TargetGroup.find_by_id(params[:target_group_id])
    tg ? tg.root.panel_provider.price : nil
  end
  
  def locations_price
    return unless params[:locations]
    params[:locations].map { |l| {id: l[:id], price: price_for_location(l[:id]) } }
  end
  
  def price_for_location(id)
    Location.find_by_id(id).try(:country).try(:panel_provider).try(:price)
  end
end
