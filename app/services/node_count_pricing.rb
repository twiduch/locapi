class NodeCountPricing < BasePricing
  
  def number_of_elements
    page.enum_for(:traverse).count
  end
  
end
