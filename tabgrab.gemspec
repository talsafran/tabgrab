$:.unshift File.expand_path("../lib", __FILE__)

require 'ultimate_guitar/version'

Gem::Specification.new do |gem|
  gem.name        = 'tabgrab'
  gem.version     = UltimateGuitar::VERSION

  gem.date        = '2012-12-16'
  gem.email       = 'tal@talsafran.com'
  gem.homepage    = 'http://github.com/talsafran/tabgrab'
  gem.summary     = 'TabGrab – Scrapes the shit out of UltimateGuitar.'
  gem.description = 'Scrapes the shit out of UltimateGuitar.'
  gem.author      = 'Tal Safran'
  gem.license     = 'MIT'

  gem.files = %x{ git ls-files }.split("\n").select { |d| d =~ %r{^(License|README|bin/|data/|ext/|lib/|spec/|test/)} }
  gem.add_dependency 'nokogiri'
end
