class TagCountPricing < BasePricing
  def price
    page.text.scan("u003c#{el}\\u003e").count
  end
end
