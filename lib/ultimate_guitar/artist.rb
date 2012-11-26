
module UltimateGuitar
  class Artist
    attr_accessor :url, :name

    def initialize(url)
      self.url = url
    end

    def tabs
      Logger.log("Fetching tabs for artist #{url}...")

      page = Nokogiri::HTML(open("#{url}?no_takeover"))
      page.css("a:regex('#{alternate_path}.*htm')", RegexLinkMatcher.new).map do |link|
        UltimateGuitar::Tab.new(link.attr(:href))
      end
    end

    protected

    # Takes an artist's URL:
    #
    #   http://www.ultimate-guitar.com/tabs/bob_dylan_tabs.htm
    #
    # And returns the alternate path (used by tabs):
    #
    #   b/bob_dylan
    def alternate_path
      url.gsub(/(.*)tabs\/(.)(.*)_tabs\.htm/, '\2/\2\3')
    end
  end
end
