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
      UltimateGuitar::fetch_with_regex("#{url}?no_takeover", "a:regex('/#{@artist.tab_path}.*htm')").map do |link|
        Tab.new(link.attr(:href))
      end
    end
  end
end
