require "csv"

puts "deleting items from database"
Conversation.destroy_all
User.destroy_all
Provider.destroy_all
Service.destroy_all
Flat.destroy_all
Offer.destroy_all
Availability.destroy_all
puts "done"
puts "starting seed"

csv_users = File.read(Rails.root.join('lib', 'seeds', 'users.csv'))
csv = CSV.parse(csv_users, :headers => true, col_sep: ';')
csv.each do |row|
  user = User.new(first_name: row["first_name"], last_name: row["last_name"], email: row["email"], password: row["password"], gender: row["gender"], description: row["description"])
  urls = []
  urls << row["photo_url_1"] if row["photo_url_1"] != ""
  urls << row["photo_url_2"] if row["photo_url_2"] != ""
  urls << row["photo_url_3"] if row["photo_url_3"] != ""
  user.save
  user.photo_urls = urls
end
puts "users loaded"

csv_providers = File.read(Rails.root.join('lib', 'seeds', 'providers.csv'))
csv = CSV.parse(csv_providers, :headers => true, col_sep: ';')
csv.each do |row|
  provider = Provider.new(first_name: row["first_name"], last_name: row["last_name"], email: row["email"], password: row["password"])
  urls = []
  urls << row["photo_url_1"] if row["photo_url_1"] != ""
  urls << row["photo_url_2"] if row["photo_url_2"] != ""
  urls << row["photo_url_3"] if row["photo_url_3"] != ""
  provider.save
  provider.photo_urls = urls
end
puts "providers loaded"

csv_services = File.read(Rails.root.join('lib', 'seeds', 'services.csv'))
csv = CSV.parse(csv_services, :headers => true, col_sep: ';')
csv.each do |row|
  service = Service.new(category: row["category"], title: row["title"], price_per_hour: row["price_per_hour"], description: row["description"], address: row["address"])
  service.provider = Provider.find_by_first_name(row["provider_first_name"])
  service.save
end
puts "services loaded"

csv_flats = File.read(Rails.root.join('lib', 'seeds', 'flats.csv'))
csv = CSV.parse(csv_flats, :headers => true, col_sep: ';')
csv.each do |row|
  flat = Flat.new(category: row["category"], address: row["address"], city: row["city"], service_charges: row["service_charges"], deposit: row["deposit"], description: row["description"], flat_area: row["flat_area"], max_roommmates: row["max_roommmates"], number_pieces: row["number_pieces"], smoker: row["smoker"], animals: row["animals"])
  flat.user = User.find_by_first_name(row["user_first_name"])
  urls = [row["photo_url_1"], row["photo_url_2"], row["photo_url_3"]]
  flat.photo_urls = urls
  flat.save
end
puts "flats loaded"

csv_offers = File.read(Rails.root.join('lib', 'seeds', 'offers.csv'))
csv = CSV.parse(csv_offers, :headers => true, col_sep: ';')
csv.each do |row|
  offer = Offer.new(content: row["content"], title: row["title"], price: row["price"], room_size: row["room_size"])
  offer.flat = Flat.find_by_address(row["flat_address"])
  offer.save
end
puts "offers loaded"

csv_availabilities = File.read(Rails.root.join('lib', 'seeds', 'availabilities.csv'))
csv = CSV.parse(csv_availabilities, :headers => true, col_sep: ';')
csv.each do |row|
  availability = Availability.new(available: row["available"], booked: row["booked"], date: row["date"])
  availability.service = Service.find_by_address(row["service_address"])
  availability.save
end
puts "availabilities loaded"

puts "the seed is done"





