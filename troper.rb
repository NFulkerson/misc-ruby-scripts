
  require 'nokogiri'
  require 'open-uri'
  
  class Lampshade
    def self.fetch_trope(link)
      page = Nokogiri::HTML(open(link))
      Trope.new(page)
    end
  end

  class Trope
    attr_accessor :name, :description, :examples, :image_url
    
    def initialize(page)
      @name = page.css('.article_title h1').inner_text
      @image_url =  page.at_css('.quoteright img').attr('src')
      @examples = []
      page.css('.folder ul li').each { |example| examples << Example.new(example.inner_text)}
    end


  end

class Example
  attr_accessor :description

  def initialize(description)
    @description = description
  end
end

# test= Nokogiri::HTML(open('http://tvtropes.org/pmwiki/pmwiki.php/Main/XanatosGambit'))

# blah = []
# test.css('.folder ul li').each { | example | blah << example.inner_text }

# puts blah[5]

mytrope = Lampshade.fetch_trope('http://tvtropes.org/pmwiki/pmwiki.php/Main/XanatosGambit')
puts mytrope.name

puts mytrope.examples[26].description