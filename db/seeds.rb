# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

flatiron = Vendor.create(name:"Flatiron AV", address: "515 N State St, Chicago, IL 60654", url:"https://flatironschool.com/", phone_number:"312-500-4049", contact_email: "info@flatironschool.com")
PermissionClass.find(1).update(title: "Co-Founder")


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

50.times do
    first_day = Faker::Time.between_dates(from: Date.today, to: (Date.today + 60), period: :morning)
    last_day = Faker::Time.between_dates(from: first_day, to: (first_day + 3), period: :night)
    show_options = [Faker::Music.unique.band, "#{Faker::Game.title} World Championship" , "#{Faker::University.name} Graduation", "#{Faker::Movie.title} Premiere", "#{Faker::Restaurant.name} Grand Opening"]
    Show.create(name: show_options[rand(5)], venue: Faker::WorldCup.stadium, client: Faker::Company.unique.name, start: first_day, end: last_day, vendor_id: 1)
end

# 50.times do
#     categories = ['Audio', 'Video', 'Lighting']
#     Equipment.create(name: "#{Faker::Music.genre} #{Faker::Music.instrument}", manufacturer: Faker::Device.manufacturer, quantity: "#{rand(50) + 1}", category: categories[rand(3)], sub_category: Faker::IndustrySegments.sub_sector, vendor:flatiron)
# end

cable_lengths = ["10'", "25'", "50'", "100'"]

Equipment.create(name: "Boxer 4k30", manufacturer: "Christie", quantity: "3", category: "Video", sub_category: "Projectors", vendor:flatiron)
Equipment.create(name: "RLS-W12", manufacturer: "Barco", quantity: "8", category: "Video", sub_category: "Projectors", vendor:flatiron)
Equipment.create(name: "LX700", manufacturer: "Christie", quantity: "16", category: "Video", sub_category: "Projectors", vendor:flatiron)
Equipment.create(name: "HDC 5500", manufacturer: "Sony", quantity: "4", category: "Video", sub_category: "Cameras", vendor:flatiron)
Equipment.create(name: "Studio Camera 4k", manufacturer: "Blackmagic", quantity: "8", category: "Video", sub_category: "Cameras", vendor:flatiron)
Equipment.create(name: '50" Flatscreen', manufacturer: "Samsung", quantity: "8", category: "Video", sub_category: "Monitors", vendor:flatiron)
Equipment.create(name: '55" Flatscreen', manufacturer: "Samsung", quantity: "8", category: "Video", sub_category: "Monitors", vendor:flatiron)
Equipment.create(name: '60" Flatscreen', manufacturer: "Samsung", quantity: "8", category: "Video", sub_category: "Monitors", vendor:flatiron)
Equipment.create(name: '65" Flatscreen', manufacturer: "Samsung", quantity: "8", category: "Video", sub_category: "Monitors", vendor:flatiron)
Equipment.create(name: 'A2 Panel', manufacturer: "Absen", quantity: "400", category: "Video", sub_category: "LED Wall", vendor:flatiron)
cable_lengths.each do |length|
    Equipment.create(name: "#{length} HDMI", manufacturer: "N/A", quantity: (rand(50) + 1), category: "Video", sub_category: "Cables", vendor:flatiron)
    Equipment.create(name: "#{length} DVI", manufacturer: "N/A", quantity: (rand(50) + 1), category: "Video", sub_category: "Cables", vendor:flatiron)
    Equipment.create(name: "#{length} VGA", manufacturer: "N/A", quantity: (rand(50) + 1), category: "Video", sub_category: "Cables", vendor:flatiron)
    Equipment.create(name: "#{length} DisplayPort", manufacturer: "N/A", quantity: (rand(50) + 1), category: "Video", sub_category: "Cables", vendor:flatiron)
    Equipment.create(name: "#{length} SDI", manufacturer: "N/A", quantity: (rand(50) + 1), category: "Video", sub_category: "Cables", vendor:flatiron)
end

##audio seed
speaker_manufacturers = %w(L-Acoustics Martin\ Audio D&B\ Audiotechnik Meyer\ Sound Void\ Acoustics Funktion-One JBL EAW)
console_manufacturers = %w(Digico Avid Yamaha Soundcraft Midas)
cable_manufacturers = %w(Gepco Neutrik Mogami Whirlwind LEX)
line_array = %w(K1 K2 Lyon Leo Leopard V-Dosc DV-DOSC V J KSL W Q Vertec VRX)
subwoofer = %w(SB18 1100 KS28 VLFC 700-HP 500-HP 218 F-21 J-SUB V-SUB)
console = %w(SD10 SD11 SD9 SD7 Profile SC48 VI-4 VI-6 Pro-2 Pro-X S6L M32)
wedge = %w(Micro/ Wedge M4 M2 MJF-210 MJF-212)
cable_types = %w(XLR NL4 NL8 Fiber\ Reel BNC XLR-5 L14-30 L21-30 Socapex)
#sub_categories = %w(Line\ Array Subwoofer Wedge Mixing\ Console)
cable = %w(5 10 25 50 100 150 250 328)

10.times do
    Equipment.create(name: line_array.sample, manufacturer: speaker_manufacturers.sample, quantity: (rand(25) + 1), category: 'Audio', sub_category: 'Line Array', vendor: flatiron)
end

10.times do
    Equipment.create(name: subwoofer.sample, manufacturer: speaker_manufacturers.sample, quantity: (rand(25) + 1), category: 'Audio', sub_category: 'Subwoofer', vendor: flatiron)
end

10.times do
    Equipment.create(name: console.sample, manufacturer: console_manufacturers.sample, quantity: (rand(25) + 1), category: 'Audio', sub_category: 'Mixing Console', vendor: flatiron)
end

10.times do
    Equipment.create(name: wedge.sample, manufacturer: speaker_manufacturers.sample, quantity: (rand(25) + 1), category: 'Audio', sub_category: 'Monitor Wedge', vendor: flatiron)
end

25.times do
    Equipment.create(name: "#{cable.sample}' #{cable_types.sample}", manufacturer: cable_manufacturers.sample, quantity: (rand(50) + 1), category: 'Audio', sub_category: 'Cable', vendor: flatiron)
end

##lighting seed
light_manufacturers = %w(Martin\ Lights ADJ Chauvet Elation Avo Antari Philips Clay\ Paky Robe Ayrton)
lx_console_manufacturers = %w(MA Avolights Hog\ Systems)
mover = %w(5r\ Beam 5r\ Spot Sharpy Profile Viper Magic\ Panel Magic\ Blade )
strobe = %w(Atomic Protron Showline Solaris JDC1)
lx_console = %w(grandMA grandMA2 grandMA3 Leprecon Full\ Boar\ 4 Hog\ 4 MagicQ Lil'\ Wing)
wash = %w(Aura Quantum Showline Mac\ 700 Rouge\ R1 Sharpy\ Wash Viper\ Wash)
lx_cable_types = %w(DMX Fiber\ Reel BNC L6-20 L21-30 Socapex)
#sub_categories = %w(Moving\ Head Strobe Wash Console)

15.times do
    Equipment.create(name: mover.sample, manufacturer: light_manufacturers.sample, quantity: (rand(25) + 1), category: 'Lighting', sub_category: 'Mover', vendor: flatiron)
end

15.times do
    Equipment.create(name: strobe.sample, manufacturer: light_manufacturers.sample, quantity: (rand(25) + 1), category: 'Lighting', sub_category: 'Strobe', vendor: flatiron)
end

10.times do
    Equipment.create(name: lx_console.sample, manufacturer: lx_console_manufacturers.sample, quantity: (rand(25) + 1), category: 'Lighting', sub_category: 'Lighting Console', vendor: flatiron)
end

10.times do
    Equipment.create(name: wash.sample, manufacturer: light_manufacturers.sample, quantity: (rand(25) + 1), category: 'Lighting', sub_category: 'Wash Light', vendor: flatiron)
end

25.times do
    Equipment.create(name: "#{cable.sample}' #{lx_cable_types.sample}", manufacturer: cable_manufacturers.sample, quantity: (rand(50) + 1), category: 'Lighting', sub_category: 'Cable', vendor: flatiron)
end



Show.all.each do |show|
    (rand(3) + 3).times do
        user = User.all.select {|user| user.permission_class.bookable }.sample
        equipment = Equipment.find(rand(Equipment.all.length) + 1)
        TechnicianBooking.create(user: user, show: show, call_time:show.start, out_time:show.end)
        EquipmentBooking.create(equipment: equipment, show: show, quantity: rand(equipment.quantity))
    end
end

















# lolla = Show.create(name: "Lollapalooza", venue:"grant park", client: "C3", start: "2020-08-20", end: "2020-08-24 23:59:59", vendor_id: 1)

# k2 = Equipment.create(name: "K2", manufacturer:"L-Acoustics", quantity: "24", category: "Audio", sub_category: "Speakers", vendor:flatiron)
# ks28 = Equipment.create(name: "KS28", manufacturer:"L-Acoustics", quantity: "16", category: "Audio", sub_category: "Speakers", vendor:flatiron)

# mikeday1 = TechnicianBooking.create(user: mike, show: lolla, call_time:"2020-08-20 02:00:00", out_time: "2020-08-20 22:00:00")
# mikeday2 = TechnicianBooking.create(user: mike, show: lolla, call_time:"2020-08-21 02:00:00", out_time: "2020-08-21 22:00:00")
# tomday1 = TechnicianBooking.create(user: tom, show: lolla, call_time:"2020-08-20 02:00:00", out_time: "2020-08-20 22:00:00")

# lolla.equipment.push(k2,ks28)