module UltimateGuitar
  class ArtistsIndex
    attr_accessor :url

    def initialize(url)
      self.url = url
    end

    def tabs
      artists.map(&:tabs)
    end

    def artists
      Logger.log("Fetching artist index #{url}...")

      page = Nokogiri::HTML(open(url))
      page.css("table table table a:regex('/tabs/.*_tabs.htm')", RegexLinkMatcher.new).map do |link|
        UltimateGuitar::Artist.new("http://ultimate-guitar.com#{link.attr(:href)}")
      end
    end
  end
end
