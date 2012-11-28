
module UltimateGuitar
  class Artist
    attr_reader :url, :pages

    def initialize(url)
      @url = url
    end

    def tabs
      pages.map(&:tabs).flatten
    end

    def pages
      @pages ||=
        Nokogiri::HTML(open("#{url}?no_takeover"))
          .css("td b a:regex('^/tabs/.*_tabs.*\.htm$')", RegexLinkMatcher.new)
          .each_with_index.map do |item, index|
            ArtistPage.new(self, index + 1)
          end
    end

    def tab_path
      # http://www.ultimate-guitar.com/tabs/bob_dylan_tabs.htm -> b/bob_dylan
      url.gsub(/(.*)tabs\/(.)(.*)_tabs\d*\.htm/, '\2/\2\3')
    end
  end
end
