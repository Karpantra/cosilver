
require 'open-uri'
require 'nokogiri'



html_file = open("https://stootie.com/stoot/services")
html_doc = Nokogiri::HTML(html_file)

services = []

# titles
html_doc.search('#stoots-list .link').each_with_index do |element, index|
  service[index] = Service.new
  service[index].title =  element.text
  service[index].save!
end

services << service[index]

# Prices
html_doc.search('.price-field').each_with_index do |element, index|
  service[index].price_per_hour = element.text.split("€")
  service[index].save!
end

services << service[index]

# names
names = []

html_doc.search('#stoots-list img').each do |element|
  names << element.attr('alt')
end
p names.uniq

# photo
photos = []
html_doc.search('#stoots-list .profile-picture-field img').each do |element|
  photos << element.attr('data-original')
end

p photos.uniq






# html_doc.search('.has-tip').each do |element|
#   p element
# end



# create_table "services", force: :cascade do |t|
#   t.string   "category"
#   t.string   "title"
#   t.string   "price_per_hour"
#   t.string   "description"
#   t.string   "address"
#   t.integer  "provider_id"
#   t.datetime "created_at",     null: false
#   t.datetime "updated_at",     null: false
#   t.index ["provider_id"], name: "index_services_on_provider_id", using: :btree
# end
