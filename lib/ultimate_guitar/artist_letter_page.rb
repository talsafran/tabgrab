module UltimateGuitar
  class ArtistLetterPage
    attr_reader :letter, :page

    def initialize(letter, page = 1)
      @letter = letter
      @page = page
    end

    def artists
      @artists ||= fetch_artists
    end

    def url
      "http://www.ultimate-guitar.com/bands/#{@letter}#{@page if @page > 1}.htm"
    end

    protected

    def fetch_artists
      Logger.log("Fetching artist index #{url}...")

      doc = Nokogiri::HTML(open(url))
      doc.css("td a:regex('^/tabs/.*_tabs.htm')", RegexLinkMatcher.new).map do |link|
        Artist.new("http://ultimate-guitar.com#{link.attr(:href)}")
      end
    end
  end
end
