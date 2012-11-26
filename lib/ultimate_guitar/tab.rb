module UltimateGuitar
  class Tab
    attr_accessor :url

    def initialize(url)
      self.url = url
    end

    def text
      Logger.log("Fetching tab #{url}...")

      page = Nokogiri::HTML(open(url))
      page.css('pre').last
    end
  end
end
