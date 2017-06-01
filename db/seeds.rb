
require 'open-uri'
require 'nokogiri'



html_file = open("https://stootie.com/stoot/services")
html_doc = Nokogiri::HTML(html_file)

Service.destroy_all
Provider.destroy_all
services = []

# titles
html_doc.search('#stoots-list .link').each_with_index do |element, index|
  services[index] = Service.new
  services[index].title =  element.text
  services[index].description =  Faker::Lorem.paragraph
end

# names
names = []

html_doc.search('#stoots-list img').each do |element|
  names << element.attr('alt')
end

names.compact!

# photo
html_doc.search('#stoots-list .profile-picture-field img').each_with_index do |element, index|
  if services[index]
    provider = services[index].create_provider!({
      first_name: names[index],
      last_name: "Toto",
      email: Faker::Internet.email,
      password: "123456",
    })

    urls = [element.attr('data-original')]
    provider.photo_urls = urls

  end
end

services.each do |service|
  service.address = ["16 villa gaudelet, paris", "123 rue de rivoli, paris", "2 faubourg saint antoine, paris", "12 rue tolbiac, paris", "8 rue censier, paris", "55 boulevard de port royal, paris"].sample
  service.category = ["Babysitting et nounous", "Cours particuliers et coaching", "Nettoyage, repassage et cuisine", "Animaux", "Réparations et dépannage", "Bricolage et jardinage", "Courses et livraison", "Déménagement", "Transport, co-voiturage", "Prestations web, design, photo", "Mode, beauté, bien-être", "Prestations administratives", "Sports, loisirs et évènements", "Informations et conseils"].sample
  service.price_per_hour = (10..100).to_a.sample
  service.save!
end






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
