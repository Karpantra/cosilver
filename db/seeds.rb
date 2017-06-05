
require 'open-uri'
require 'nokogiri'



html_file = open("https://stootie.com/stoot/services")
html_doc = Nokogiri::HTML(html_file)

Service.destroy_all
Provider.destroy_all

# titles
# html_doc.search('#stoots-list .link').each_with_index do |element, index|
#   services[index] = Service.new
#   services[index].title =  element.text
#   services[index].description = Faker::Lorem.paragraph
# end

# names
# names = []
# services = []

# html_doc.search('#stoots-list img').each do |element|
#   names << element.attr('alt')
# end

# names.compact!

# # photo
# html_doc.search('#stoots-list .profile-picture-field img').each_with_index do |element, index|
#   if services[index]
#     provider = services[index].create_provider!({
#       first_name: names[index],
#       last_name: "Toto",
#       email: Faker::Internet.email,
#       password: "123456",
#     })

#     provider.photo_urls = ["https://unsplash.com/search/worker?photo=UuW4psOb388", "https://unsplash.com/search/worker?photo=fQxMGkYXqFU", "https://unsplash.com/search/photos/male?photo=sok0YssrV5g", "https://unsplash.com/search/photos/male?photo=vmBik4xv27s", "https://unsplash.com/search/photos/male?photo=lCVP-lu0kxk", "https://unsplash.com/search/photos/male?photo=kB7SzzDgM3o", "https://unsplash.com/search/photos/female?photo=_KaMTEmJnxY", "https://unsplash.com/search/photos/female?photo=K-chxjiTu7c", "https://unsplash.com/search/photos/female?photo=mS55sdqJ9uU", "https://unsplash.com/search/photos/female?photo=i2AmfpRO0Cc", "https://unsplash.com/search/photos/female?photo=_ehb7RsbYRc", "https://unsplash.com/search/photos/female?photo=Yrjprzq-1jk", "https://unsplash.com/search/photos/female?photo=B3VWevRn1oU"].sample

#   end
# end

20.times do
  Provider.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123456")
end

category = ["Babysitting et nounous", "Cours particuliers et coaching", "Nettoyage, repassage et cuisine", "Animaux", "Réparations et dépannage", "Bricolage et jardinage", "Courses et livraison", "Déménagement", "Transport, co-voiturage", "Prestations web, design, photo", "Mode, beauté, bien-être", "Prestations administratives", "Sports, loisirs et évènements", "Informations et conseils"]
address = ["16 villa gaudelet, paris", "12 rue de strasbourg, paris", "5 rue barbès, levallois", "10 villa gaudelet, paris", "123 rue de rivoli, paris", "2 faubourg saint antoine, paris", "12 rue tolbiac, paris", "8 rue censier, paris", "55 boulevard de port royal, paris"]
10.times do
  Service.create(category: category.sample, title: Faker::Lorem.sentence, address: address.sample, price_per_hour: (10..50).to_a.sample, provider: Provider.all.sample )
end
# services.each do |service, index|
#   service = Service.new
#   services[index].description.category = ["Babysitting et nounous", "Cours particuliers et coaching", "Nettoyage, repassage et cuisine", "Animaux", "Réparations et dépannage", "Bricolage et jardinage", "Courses et livraison", "Déménagement", "Transport, co-voiturage", "Prestations web, design, photo", "Mode, beauté, bien-être", "Prestations administratives", "Sports, loisirs et évènements", "Informations et conseils"].sample
#   services[index].title = Faker::Lorem.sentence
#   services[index].address = ["16 villa gaudelet, paris", "12 rue de strasbourg, paris", "5 rue barbès, levallois", "10 villa gaudelet, paris", "123 rue de rivoli, paris", "2 faubourg saint antoine, paris", "12 rue tolbiac, paris", "8 rue censier, paris", "55 boulevard de port royal, paris"].sample
#   services[index].price_per_hour = (10..50).to_a.sample
#   services[index].save!
# end



flats_attributes = [
  {
    category: "Appartement",
    address: "112 rue du Fg St-Honoré ",
    city:  '75008 Paris',
    service_charges: 300,
    deposit: 500,
    description: "Face au jardin, on découvre une salle lumineuse... et la cuisine d'Éric Frechon.",
    flat_area: 125,
    max_roommmates: 3,
    number_pieces: 2,
    smoker: true,
    animals: false,
  },
  {
    category: "Maison",
    address: "4 rue Blainville ",
    city: "75005 Paris",
    service_charges: 150,
    deposit: 100,
    description: "Une valeur sûre que cette belle maison du 17e, ",
    flat_area: 75,
    max_roommmates: 4,
    number_pieces: 2,
    smoker: true,
    animals: false,
  },
  {
    category: "Maison",
    address: " 3 route de Suresnes ",
    city: "75016 Paris",
    service_charges: 50,
    deposit: 200,
    description: "Oeil vif, geste sûr: impossible de distinguer, dans les créations de Frédéric Anton...",
    flat_area: 45,
    max_roommmates: 2,
    number_pieces: 3,
    smoker: false,
    animals: false,
  },
    {
    category: "Appartement",
    address: "10 rue de la paix ",
    city:  "Paris",
    service_charges: 30,
    deposit: 54,
    description: "Belle appartement pour deux personne, à deux pas du metro et de toute les commodités ! ",
    flat_area: 45,
    max_roommmates: 3,
    number_pieces: 4,
    smoker: true,
    animals: true,
  },
    {
    category: "Appartement",
    address: " 14 rue condorcet",
    city:  "Paris",
    service_charges: 30,
    deposit: 550,
    description: "Petit appartement de deux chambres, belle luminosité, tout équipe ! ",
    flat_area: 55,
    max_roommmates: 2,
    number_pieces: 4,
    smoker: true,
    animals:false,
  },
    {
    category: "Appartement",
    address: "56 rue de l'université",
    city:  "Paris",
    service_charges: 130,
    deposit: 450,
    description: "Très belle appartement avec 5 chambres et 3 salles de bain, il dispose également d'un grand salon, parfait pour des apéro entre amis ! ",
    flat_area: 110,
    max_roommmates: 4,
    number_pieces: 7,
    smoker: true,
    animals: false,
  },
]

Flat.create!(flats_attributes)

# has_attachement :photos  (many)
urls = [
  'http://static.cotemaison.fr/medias_10600/w_1121,h_841,c_crop,x_59,y_0/w_640,h_358,c_fill,g_center/v1443457866/appartement-arty-et-design-a-amsterdam-11_5427515.jpg',
  'http://www.paris-appartements-services.com/img/photo/11/1.jpg',
]

flat = Flat.new
flat.save!
flat.photo_urls = urls


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
