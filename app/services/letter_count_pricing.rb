class LetterCountPricing < BasePricing
  def number_of_elements
    @num ||= page.text.scan(el).count
  end
end
