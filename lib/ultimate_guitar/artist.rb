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
      @pages ||= UltimateGuitar::fetch_with_regex("#{url}?no_takeover", "td b a:regex('^/tabs/.*_tabs.*\.htm$')")
        .each_with_index.map do |item, index|
          ArtistPage.new(self, index + 1)
        end
      @pages = [ArtistPage.new(self, 1)] if @pages.empty?
      @pages
    end

    def tab_path
      # http://www.ultimate-guitar.com/tabs/bob_dylan_tabs.htm -> b/bob_dylan
      url.gsub(/(.*)tabs\/(.)(.*)_tabs\d*\.htm/, '\2/\2\3')
    end
  end
end
