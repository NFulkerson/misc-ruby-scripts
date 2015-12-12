require 'open-uri'
require 'nokogiri'

@doc = Nokogiri::HTML(open("http://tvtropes.org/pmwiki/pmwiki.php/Main/BadassNormal")) do |config|
  config.strict.nonet
end

title = @doc.css('title')
puts title.inner_text
