module UltimateGuitar
  class ArtistLetter
    attr_reader :letter, :pages

    def initialize(letter)
      @letter = letter.downcase
    end

    def pages
      @pages ||=
        Nokogiri::HTML(open(url))
          .css("td b a:regex('^/bands/#{@letter}.*.htm')", RegexLinkMatcher.new)
          .each_with_index.map do |item, index|
            ArtistLetterPage.new(@letter, index + 1)
          end
    end

    def artists
      pages.map(&:artists).flatten
    end

    def url
      "http://www.ultimate-guitar.com/bands/#{@letter}.htm"
    end
  end
end
