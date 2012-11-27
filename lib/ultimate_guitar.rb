require 'nokogiri'
require 'open-uri'

Dir.glob(File.dirname(File.absolute_path(__FILE__)) + '/*/*') { |f| require f }
