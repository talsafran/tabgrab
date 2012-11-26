require 'nokogiri'
require 'open-uri'

%w(regex_link_matcher logger).each { |f| require "../helpers/#{f}" }
%w(artist artists_index tab).each   { |f| require "./#{f}" }
