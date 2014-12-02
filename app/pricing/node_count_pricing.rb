class NodeCountPricing < BasePricing
  
  def number_of_elements
    @num ||= page.enum_for(:traverse).select{|e| e.is_a?(Nokogiri::XML::Node)}.count
  end
  
end
