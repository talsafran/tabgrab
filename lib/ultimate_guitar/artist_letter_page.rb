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
      UltimateGuitar::fetch_with_regex(url, "td a:regex('^/tabs/.*_tabs.htm')").map do |link|
        Artist.new("http://ultimate-guitar.com#{link.attr(:href)}")
      end
    end
  end
end
