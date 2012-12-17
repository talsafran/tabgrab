module UltimateGuitar
  class Tab
    attr_reader :url, :text

    def initialize(url)
      @url = url
    end

    def text
      @text ||= fetch_text
    end

    protected

    def fetch_text
      tab_text = UltimateGuitar::fetch(url).css('pre').last
      tab_text ? tab_text.text : ''
    end
  end
end
