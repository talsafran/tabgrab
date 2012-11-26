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
      Logger.log("Fetching tab #{url}...")

      page = Nokogiri::HTML(open(url))
      page.css('pre').last || ''
    end
  end
end
