\connect postgres

drop database if exists phase2;
create database phase2;

\connect phase2

\i create.sql

\copy Users(username, Name, Bio, Location, Language, Email, Phone, Birthday) FROM 'Users.csv'		csv
\copy Host(calendar_link,rating,Users_username) FROM 'Hosts.csv'		csv 
\copy Guests(Users_username) FROM 'Guests.csv'		csv 
\copy Amenities(description) FROM 'Amenities.csv'		csv 
\copy num_rooms(num_rooms,guest_capacity) FROM 'num_room.csv'		csv 
\copy Properties(size,address,city,country, house_type,description,num_rooms_num_rooms) FROM 'Property.csv'		csv 
\copy Listing(description,num_rooms,price,perincr,Host_Users_username,Properties_property_id) FROM 'Listing.csv'		csv 
\copy Bookings(start_date,end_date,coupon_code,date_booked,status,payment_info,Listing_listing_id,Guests_Users_username) FROM 'Bookings.csv'		csv 
\copy Has(Properties_property_id,Amenities_amenity_id) FROM 'Has.csv'		csv 
\copy Page(description,group_size,activity_category,location,Host_Users_username) FROM 'Pages.csv'		csv
\copy Rooms(description,Listing_listing_id) FROM 'Rooms.csv'		csv 
\copy Private_room(Rooms_room_id) FROM 'Private_room.csv'		csv 
\copy shared_room(Rooms_room_id) FROM 'shared_room.csv'		csv

\i show_all.sql



