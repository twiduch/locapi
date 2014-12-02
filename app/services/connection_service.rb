require 'open-uri'

class ConnectionService < Struct.new(:url)

  def page
    doc
  end
  
  def no_js_page
    doc.css('script').remove
    doc
  end
  
  def doc
    @doc ||= Nokogiri::HTML(open(url))
  end
  
  
end
