class LetterCountPricing < BasePricing
  def number_of_elements
    @num ||= no_js_page.text.scan(el).count
  end
end
