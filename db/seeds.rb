
require 'open-uri'
require 'nokogiri'



html_file = open("https://stootie.com/stoot/services")
html_doc = Nokogiri::HTML(html_file)

# html_doc.search('#stoots-list .link').each do |element|
#   puts element.text
# end

html_doc.search('#stoots-list a .img').each do |element|
  puts element.attr('href')
end

# html_doc.search('.price-field').each do |element|
#   puts element.text
# end
