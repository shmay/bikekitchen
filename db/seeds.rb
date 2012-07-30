# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


a = Account.find_by_title('SLO Bike Kitchen')
if not a
  a = Account.create(title:'SLO Bike Kitchen', phone:'805-123-2241', info:'the bike kitchen',
                        city:'San Luis Obispo',zip:'93401')
end
emails = ['kmurph73@gmail.com', 'd@y.net']
emails.each do |e|
  user = User.new(email:e, password:'pass11', password_confirmation:'pass11')
  user.account_id = a.id
  if e =~ /^kmurph73/
    user.admin = 1
  end
  user.save
end
