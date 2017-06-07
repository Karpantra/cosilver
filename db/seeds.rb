require "csv"

User.destroy_all

csv_users = File.read(Rails.root.join('lib', 'seeds', 'users.csv'))
csv = CSV.parse(csv_users, :headers => true, col_sep: ';')
# puts csv_users
csv.each do |row|
  user = User.new(first_name: row["first_name"], last_name: row["last_name"], email: row["email"], password: row["password"], gender: row["gender"], description: row["description"])
  urls = []
  urls << row["photo_url_1"] if row["photo_url_1"] != ""
  urls << row["photo_url_2"] if row["photo_url_2"] != ""
  urls << row["photo_url_3"] if row["photo_url_3"] != ""
  user.save
  user.photo_urls = urls
end

