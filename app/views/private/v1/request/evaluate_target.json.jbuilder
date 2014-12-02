json.prices do
  json.country_code_price @country_code_price if @country_code_price
  json.target_group_price @target_group_price if @target_group_price
  json.locations_price @locations_price if @locations_price
end
