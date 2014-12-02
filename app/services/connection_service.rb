require 'open-uri'

class ConnectionService < Struct.new(:url)

  def page
    Nokogiri::HTML(open(url))
  end
  
end
