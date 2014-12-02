class PricingFactory < Struct.new(:code)

  def pricing
    return unless code
    case code.to_sym
      when :letter_count then letter_count
      when :tag_count then tag_count
    else node_count
    end
  end
  
  private
  def letter_count
    LetterCountPricing.new("http://time.com", 'a')
  end
  
  def tag_count
    TagCountPricing.new("https://ajax.googleapis.com/ajax/services/feed/find?v=1.0&q=news", 'b')
  end
  
  def node_count
    NodeCountPricing.new("http://time.com")
  end
end
