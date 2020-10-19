# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

si = Vendor.create(name:"Sound Investment", address: "123 Main St.", url:"www.sound-investment.com", phone_number:"312-666-4200", contact_email: "eventopedia@soundinvestment.com")

owner = PermissionClass.create(title: "owner", vendor: si, create_users: true, create_equipment:true, create_show:true, book_technician:true, book_equipment:true )
tech = PermissionClass.create(title: "tech", vendor:si, create_users: false, create_equipment:false, create_show:false, book_technician:false, book_equipment:true )
ware = PermissionClass.create(title: "warehouse", vendor:si, create_users: false, create_equipment:true, create_show:false, book_technician:false, book_equipment:true )

peter = User.create(username:"peter", permission_class: owner, vendor: si)
mike = User.create(username:"mike", permission_class:tech, vendor:si)
tom = User.create(username:"tom", permission_class:tech, vendor:si)
marc = User.create(username:"marc", permission_class: ware, vendor:si)

k2 = Equipment.create(name: "K2", manufacturer:"L-Acoustics", quantity: "24", category: "Audio", sub_category: "Speakers", vendor: si)
ks28 = Equipment.create(name: "KS28", manufacturer:"L-Acoustics", quantity: "16", category: "Audio", sub_category: "Speakers", vendor: si)

lolla = Show.create(venue:"grant park", start: "2020-08-20", end: "2020-08-24", vendor: si)
lolla.users.push(tom,mike)
lolla.equipment.push(k2,ks28)



