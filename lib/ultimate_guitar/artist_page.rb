module UltimateGuitar
  class ArtistPage
    attr_reader :artist, :page, :tabs

    def initialize(artist, page = 1)
      @artist = artist
      @page = page
    end

    def url
      @artist.url.gsub('.htm', "#{page if page > 1}.htm")
    end

    def tabs
      @tabs ||= fetch_tabs
    end

    protected

    def fetch_tabs
      Logger.log("Fetching tabs for artist #{url}...")

      doc = Nokogiri::HTML(open("#{url}?no_takeover"))
      doc.css("a:regex('#{@artist.tab_path}.*htm')", RegexLinkMatcher.new).map do |link|
        puts link.attr(:href)
        Tab.new(link.attr(:href))
      end
    end
  end
end
