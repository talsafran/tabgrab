$LOAD_PATH << File.dirname(__FILE__)

require 'nokogiri'
require 'open-uri'

require 'ultimate_guitar/artist'
require 'ultimate_guitar/artist_letter'
require 'ultimate_guitar/artist_letter_page'
require 'ultimate_guitar/artist_page'
require 'ultimate_guitar/tab'
require 'ultimate_guitar/version'
require 'ultimate_guitar/helpers/logger'
require 'ultimate_guitar/helpers/regex_link_matcher'

module UltimateGuitar
  class << self
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

      begin
        Nokogiri::HTML(open(url))
      rescue Exception => e
        UltimateGuitar::Logger.log("Couldn't get #{url} - #{e.message}")
        Nokogiri::HTML::Document.new
      end
    end
  end
end
