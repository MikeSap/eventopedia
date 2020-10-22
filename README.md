GitHub::Markup.render(file, File.read(file))

# Eventopedia - Event, Inventory, and Schedule Management
 App created with Ruby on Rails, and Bootstrap


 ## Table of Contents 
 * [General info](#general-info) 
 * [Technologies](#technologies) 
 * [Usage](#usage)
 * [Status](#status) 
 * [Credit](#credit)


### General info 
This project is our second project after completing mod 2 out of 5 at Flatiron Bootcamp, and inspired by a popular rental inventory app called Flex Rental Solutions. It is a web based internal database for managing inventory, scheduling and events. 

### Technologies 
* rails 6
* sqlite
* bcrypt
* faker

### Usage 
Eventopedia has many uses, and a modular permissions systems. Upon reaching the home page, if you are not logged in, you will be redirected to our login page. Here, you can select the vendor you work for or manage, and then log in. Each vendor can have a unique list of logins that do not conflict with other vendors. Upon login, our index page displays 5 events if they are within the next 14 days, along with the most recently aquired inventory, and equipment that was recently booked on a show. There is a navigation bar that will take you to index pages for Shows, Equipment, Staff, and if the user is an admin (Defaults to user that registers the vendor) there is a Manage page for your vendor where you can manage permissions for all users.
1. Shows - 
Here you will get a list of shows with pertinent info and a link to the view show page, where you can add equipment to the show, and also book technicians. Both of these bookings will validate to availability based on date, and also inventory quantities. You can also create a new show here.
2. Equipment - 
Here You will see a table for each main category of your equipment, and you are able to add equipment here or also click the name of the item to view more info about that item.
3. Staff - Here is a table that lists all staff members of this vendor with their job title or permissions role. Admins can delete any user here and a user can edit their info and password here.
4. Manage - Here, an admin can update vendor info, and also edit job title permissions. 


## Status

## Credit 
