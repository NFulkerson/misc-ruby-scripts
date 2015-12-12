require 'nokogiri'
require 'open-uri'

tropeList = []

page = Nokogiri::HTML(open('http://tvtropes.org/pmwiki/pmwiki.php/Main/Tropes'))

links = page.css('a').map { |a| a['href'] if a['href'] =~ /^\/pmwiki\/pmwiki.php\/Main\// }.compact.uniq

puts links

