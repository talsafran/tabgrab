module UltimateGuitar
  class ArtistsIndex
    attr_accessor :url, :artists

    def initialize(url)
      @url = url
    end

    def artists
      @artists ||= fetch_artists
    end

    protected

    def fetch_artists
      Logger.log("Fetching artist index #{url}...")

      page = Nokogiri::HTML(open(url))
      page.css("table table table a:regex('/tabs/.*_tabs.htm')", RegexLinkMatcher.new).map do |link|
        UltimateGuitar::Artist.new("http://ultimate-guitar.com#{link.attr(:href)}")
      end
    end
  end
end
