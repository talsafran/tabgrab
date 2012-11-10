require 'nokogiri'
require 'open-uri'

module UltimateGuitar
  class Tab
    attr_accessor :url

    def initialize(url)
      self.url = url
    end

    def html
      doc = Nokogiri::HTML(open(url))
      doc.css('pre').last
    end
  end
end
