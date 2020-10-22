# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

flatiron = Vendor.create(name:"Flatiron AV", address: "515 N State St, Chicago, IL 60654", url:"https://flatironschool.com/", phone_number:"312-500-4049", contact_email: "info@flatironschool.com")

v1 = PermissionClass.create(title: "V1", vendor:flatiron, create_users: false, create_equipment:false, create_show:false, book_technician:false, book_equipment:true, bookable:true )
v2 = PermissionClass.create(title: "V2", vendor:flatiron, create_users: false, create_equipment:false, create_show:false, book_technician:false, book_equipment:true, bookable:true )
a1 = PermissionClass.create(title: "A1", vendor:flatiron, create_users: false, create_equipment:false, create_show:false, book_technician:false, book_equipment:true, bookable:true )
a2 = PermissionClass.create(title: "A2", vendor:flatiron, create_users: false, create_equipment:false, create_show:false, book_technician:false, book_equipment:true, bookable:true )
l1 = PermissionClass.create(title: "L1", vendor:flatiron, create_users: false, create_equipment:false, create_show:false, book_technician:false, book_equipment:true, bookable:true )
l2 = PermissionClass.create(title: "L2", vendor:flatiron, create_users: false, create_equipment:false, create_show:false, book_technician:false, book_equipment:true, bookable:true )

vwarehouse = PermissionClass.create(title: "Video Shop Supervisor", vendor:flatiron, create_users: false, create_equipment:true, create_show:false, book_technician:false, book_equipment:true, bookable:false )
awarehouse = PermissionClass.create(title: "Audio Shop Supervisor", vendor:flatiron, create_users: false, create_equipment:true, create_show:false, book_technician:false, book_equipment:true, bookable:false )
lwarehouse = PermissionClass.create(title: "Lighting Shop Supervisor", vendor:flatiron, create_users: false, create_equipment:true, create_show:false, book_technician:false, book_equipment:true, bookable:false )

pm = PermissionClass.create(title: "Project Manager", vendor:flatiron, create_users: false, create_equipment:true, create_show:true, book_technician:true, book_equipment:true, bookable:false )
sales = PermissionClass.create(title: "Sales Representative", vendor:flatiron, create_users: false, create_equipment:false, create_show:true, book_technician:false, book_equipment:false, bookable:false )

tom = User.create(username:"tbigelow", first_name: 'Tom', last_name: 'Bigelow', password: "123", password_confirmation: "123", permission_class_id: 1, vendor:flatiron)
mike = User.create(username:"msapienza", first_name: 'Mike', last_name: 'Sapienza', password: "123", password_confirmation: "123", permission_class_id: 1, vendor:flatiron)

[v1, a1, l1, v2, a2, l2, vwarehouse, awarehouse, lwarehouse, pm, sales].each do |role|
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    username = "#{first_name.chars.first}#{last_name}".downcase
    User.create(username:username, first_name: first_name, last_name: last_name, password: "123", password_confirmation: "123", permission_class: role, vendor:flatiron)
end


lolla = Show.create(name: "Lollapalooza", venue:"grant park", client: "C3", start: "2020-08-20", end: "2020-08-24 23:59:59", vendor_id: 1)
50.times do
    first_day = Faker::Time.between_dates(from: Date.today, to: (Date.today + 60), period: :morning)
    last_day = Faker::Time.between_dates(from: first_day, to: (first_day + 3), period: :night)
    show_options = [Faker::Music.unique.band, "#{Faker::Game.title} World Championship" , "#{Faker::University.name} Graduation", "#{Faker::Movie.title} Premiere", "#{Faker::Restaurant.name} Grand Opening"]
    Show.create(name: show_options[rand(5)], venue: Faker::WorldCup.stadium, client: Faker::Company.unique.name, start: first_day, end: last_day, vendor_id: 1)
end

50.times do
    categories = ['Audio', 'Video', 'Lighting']
    Equipment.create(name: "#{Faker::Music.genre} #{Faker::Music.instrument}", manufacturer: Faker::Device.manufacturer, quantity: "#{rand(50) + 1}", category: categories[rand(3)], sub_category: Faker::IndustrySegments.sub_sector, vendor:flatiron)
end

Show.all.each do |show|
    (rand(3) + 3).times do
        user = User.all.select {|user| user.permission_class.bookable }.sample
        equipment = Equipment.find(rand(Equipment.all.length) + 1)
        TechnicianBooking.create(user: user, show: show, call_time:show.start, out_time:show.end)
        EquipmentBooking.create(equipment: equipment, show: show, quantity: rand(equipment.quantity))
    end
end

# k2 = Equipment.create(name: "K2", manufacturer:"L-Acoustics", quantity: "24", category: "Audio", sub_category: "Speakers", vendor:flatiron)
# ks28 = Equipment.create(name: "KS28", manufacturer:"L-Acoustics", quantity: "16", category: "Audio", sub_category: "Speakers", vendor:flatiron)

# mikeday1 = TechnicianBooking.create(user: mike, show: lolla, call_time:"2020-08-20 02:00:00", out_time: "2020-08-20 22:00:00")
# mikeday2 = TechnicianBooking.create(user: mike, show: lolla, call_time:"2020-08-21 02:00:00", out_time: "2020-08-21 22:00:00")
# tomday1 = TechnicianBooking.create(user: tom, show: lolla, call_time:"2020-08-20 02:00:00", out_time: "2020-08-20 22:00:00")

# lolla.equipment.push(k2,ks28)