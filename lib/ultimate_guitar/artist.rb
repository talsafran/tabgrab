require 'nokogiri'
require 'open-uri'

module UltimateGuitar
  class Artist
    attr_accessor :url

    def initialize(url)
      self.url = url
    end

    def tabs
      doc = Nokogiri::HTML(open(url))
      doc.css("a:regex('#{url}.*htm')", TabLinkMatcher.new).map do |link|
        link.attr(:href)
      end
    end
  end

  class TabLinkMatcher
    def regex(node_set, regex)
      node_set.find_all { |node| node['href'] =~ /#{regex}/ }
    end
  end
end
