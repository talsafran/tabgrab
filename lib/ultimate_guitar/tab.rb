module UltimateGuitar
  class Tab
    attr_accessor :url, :text

    def initialize(url)
      @url = url
    end

    def text
      @text ||= fetch_text
    end

    protected

    def fetch_text
      UltimateGuitar::fetch(url).css('pre').last || ''
    end
  end
end
