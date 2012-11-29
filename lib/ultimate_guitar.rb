require 'nokogiri'
require 'open-uri'

Dir.glob(File.dirname(File.absolute_path(__FILE__)) + '/ultimate_guitar/*') { |f| require f }
Dir.glob(File.dirname(File.absolute_path(__FILE__)) + '/../helpers/*') { |f| require f }

module UltimateGuitar
  def fetch_with_regex(url, regex)
    fetch(url).css(regex, RegexLinkMatcher.new)
  end

  def fetch(url)
    Logger.log("Fetching #{url}...")

    begin
      Nokogiri::HTML(open(url))
    rescue Exception => e
      Logger.log("Couldn't get #{url} - #{e.message}")
      []
    end
  end
end
