require 'nokogiri'
require 'open-uri'

Dir.glob(File.dirname(File.absolute_path(__FILE__)) + '/*/*') { |f| require f }

module UltimateGuitar
  def fetch_with_regex(url, regex)
    begin
      fetch(url).css(regex, RegexLinkMatcher.new)
    rescue Exception => e
      Logger.log("Couldn't get #{url} - #{e.message}")
      []
    end
  end

  def fetch(url)
    Logger.log("Fetching #{url}...")
    Nokogiri::HTML(open(url))
  end
end
