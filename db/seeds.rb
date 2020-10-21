# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

si = Vendor.create(name:"Sound Investment", address: "123 Main St.", url:"www.sound-investment.com", phone_number:"312-666-4200", contact_email: "eventopedia@soundinvestment.com")

tech = PermissionClass.create(title: "tech", vendor:si, create_users: false, create_equipment:false, create_show:false, book_technician:false, book_equipment:true, bookable:true )
ware = PermissionClass.create(title: "warehouse", vendor:si, create_users: false, create_equipment:true, create_show:false, book_technician:false, book_equipment:true, bookable:false )

peter = User.create(username:"peter", first_name: 'Peter', last_name: 'Vanek', password: "123", password_confirmation: "123", permission_class_id: 1, vendor: si)
mike = User.create(username:"mike", first_name: 'Mike', last_name: 'Sapienza', password: "123", password_confirmation: "123", permission_class:tech, vendor:si)
tom = User.create(username:"tom", first_name: 'Tom', last_name: 'Bigelow', password: "123", password_confirmation: "123", permission_class:tech, vendor:si)
marc = User.create(username:"marc", first_name: 'Marc', last_name: 'Ecco', password: "123", password_confirmation: "123", permission_class: ware, vendor:si)

k2 = Equipment.create(name: "K2", manufacturer:"L-Acoustics", quantity: "24", category: "Audio", sub_category: "Speakers", vendor: si)
ks28 = Equipment.create(name: "KS28", manufacturer:"L-Acoustics", quantity: "16", category: "Audio", sub_category: "Speakers", vendor: si)

lolla = Show.create(name: "Lollapalooza", venue:"grant park", client: "C3", start: "2020-08-20", end: "2020-08-24 23:59:59", vendor_id: 1)

mikeday1 = TechnicianBooking.create(user: mike, show: lolla, call_time:"2020-08-20 02:00:00", out_time: "2020-08-20 22:00:00")
mikeday2 = TechnicianBooking.create(user: mike, show: lolla, call_time:"2020-08-21 02:00:00", out_time: "2020-08-21 22:00:00")
tomday1 = TechnicianBooking.create(user: tom, show: lolla, call_time:"2020-08-20 02:00:00", out_time: "2020-08-20 22:00:00")

# lolla.equipment.push(k2,ks28)