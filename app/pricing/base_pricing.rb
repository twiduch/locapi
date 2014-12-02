class BasePricing

  attr_reader :url, :el
  
  def initialize(url = 'http://time.com', el = nil)
    @url = url
    @el = el
  end
  
  def price
    number_of_elements == 0 ? 0 : number_of_elements.to_f / 100
  end
  
  def number_of_elements
    raise 'implement me'
  end
  
  def page
    connection_service.page
  end
  
  def no_js_page
    connection_service.no_js_page
  end
  
  def connection_service
    @service ||= ConnectionService.new(url)
  end
end
