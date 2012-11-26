
module UltimateGuitar
  class Artist
    attr_accessor :url, :name, :tabs

    def initialize(url)
      @url = url
    end

    def tabs
      @tabs ||= fetch_tabs
    end

    protected

    def tab_path
      # http://www.ultimate-guitar.com/tabs/bob_dylan_tabs.htm -> b/bob_dylan
      url.gsub(/(.*)tabs\/(.)(.*)_tabs\.htm/, '\2/\2\3')
    end

    def fetch_tabs
      Logger.log("Fetching tabs for artist #{url}...")

      page = Nokogiri::HTML(open("#{url}?no_takeover"))
      page.css("a:regex('#{tab_path}.*htm')", RegexLinkMatcher.new).map do |link|
        UltimateGuitar::Tab.new(link.attr(:href))
      end
    end
  end
end
