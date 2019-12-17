-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-12-05 00:44:30.972

-- tables
-- Table: Amenities
CREATE TABLE Amenities (
    amenity_id serial  NOT NULL,
    description varchar(256)  NOT NULL,
    CONSTRAINT Amenities_pk PRIMARY KEY (amenity_id)
);

-- Table: Bookings
CREATE TABLE Bookings (
    booking_id serial  NOT NULL,
    start_date date  NOT NULL,
    end_date date  NOT NULL,
    coupon_code int  NOT NULL,
    date_booked date  NOT NULL,
    status varchar(16)  NOT NULL,
    payment_info bigint  NOT NULL,
    Listing_listing_id int  NOT NULL,
    Guests_Users_username varchar(16)  NOT NULL,
    CONSTRAINT Bookings_pk PRIMARY KEY (booking_id)
);

-- Table: Guests
CREATE TABLE Guests (
    Users_username varchar(16)  NOT NULL,
    CONSTRAINT Guests_pk PRIMARY KEY (Users_username)
);

-- Table: Has
CREATE TABLE Has (
    Properties_property_id int  NOT NULL,
    Amenities_amenity_id int  NOT NULL,
    CONSTRAINT Has_pk PRIMARY KEY (Properties_property_id,Amenities_amenity_id)
);

-- Table: Host
CREATE TABLE Host (
    calendar_link varchar(50)  NOT NULL,
    rating decimal(3,2)  NOT NULL,
    Users_username varchar(16)  NOT NULL,
    CONSTRAINT Host_pk PRIMARY KEY (Users_username)
);

-- Table: Listing
CREATE TABLE Listing (
    listing_id serial  NOT NULL,
    description varchar(256)  NOT NULL,
    num_rooms int  NOT NULL,
    price bigint  NOT NULL,
    perincr real  NOT NULL,
    Host_Users_username varchar(16)  NOT NULL,
    Properties_property_id int NOT NULL,
    CONSTRAINT Listing_pk PRIMARY KEY (listing_id)
);

-- Table: Page
CREATE TABLE Page (
    page_id serial  NOT NULL,
    description varchar(256)  NOT NULL,
    group_size int  NOT NULL,
    activity_category varchar(16)  NOT NULL,
    location varchar(16)  NOT NULL,
    Host_Users_username varchar(16)  NOT NULL,
    CONSTRAINT Page_pk PRIMARY KEY (page_id)
);

-- Table: Private_room
CREATE TABLE Private_room (
    Rooms_room_id int  NOT NULL,
    CONSTRAINT Private_room_pk PRIMARY KEY (Rooms_room_id)
);

-- Table: Properties
CREATE TABLE Properties (
    property_id serial  NOT NULL,
    size bigint  NOT NULL,
    address varchar(16)  NOT NULL,
    city varchar(16) NOT NULL,
    country varchar(16) NOT NULL,
    house_type varchar(16)  NOT NULL,
    description varchar(256)  NOT NULL,
    num_rooms_num_rooms int  NOT NULL,
    CONSTRAINT Properties_pk PRIMARY KEY (property_id)
);

-- Table: Rooms
CREATE TABLE Rooms (
    room_id serial  NOT NULL,
    description varchar(256)  NOT NULL,
    Listing_listing_id int  NOT NULL,
    CONSTRAINT Rooms_pk PRIMARY KEY (room_id)
);

-- Table: Shared_room
CREATE TABLE Shared_room (
    Rooms_room_id int  NOT NULL,
    CONSTRAINT Shared_room_pk PRIMARY KEY (Rooms_room_id)
);


-- Table: Users
CREATE TABLE Users (
    username varchar(16)  NOT NULL,
    Name varchar(16)  NOT NULL,
    Bio varchar(100)  NOT NULL,
    Location varchar(16)  NOT NULL,
    Language varchar(16)  NOT NULL,
    Email varchar(30)  NOT NULL,
    Phone bigint  NOT NULL,
    Birthday date  NOT NULL,
    CONSTRAINT Users_pk PRIMARY KEY (username)
);

-- Table: num_rooms
CREATE TABLE num_rooms (
    num_rooms int  NOT NULL,
    guest_capacity int  NOT NULL,
    CONSTRAINT num_rooms_pk PRIMARY KEY (num_rooms)
);

-- foreign keys
-- Reference: Bookings_Guests (table: Bookings)
ALTER TABLE Bookings ADD CONSTRAINT Bookings_Guests
    FOREIGN KEY (Guests_Users_username)
    REFERENCES Guests (Users_username)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Bookings_Listing (table: Bookings)
ALTER TABLE Bookings ADD CONSTRAINT Bookings_Listing
    FOREIGN KEY (Listing_listing_id)
    REFERENCES Listing (listing_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Guests_Users (table: Guests)
ALTER TABLE Guests ADD CONSTRAINT Guests_Users
    FOREIGN KEY (Users_username)
    REFERENCES Users (username)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Has_Amenities (table: Has)
ALTER TABLE Has ADD CONSTRAINT Has_Amenities
    FOREIGN KEY (Amenities_amenity_id)
    REFERENCES Amenities (amenity_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Has_Properties (table: Has)
ALTER TABLE Has ADD CONSTRAINT Has_Properties
    FOREIGN KEY (Properties_property_id)
    REFERENCES Properties (property_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Hosts_Users (table: Host)
ALTER TABLE Host ADD CONSTRAINT Hosts_Users
    FOREIGN KEY (Users_username)
    REFERENCES Users (username)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Listing_Hosts (table: Listing)
ALTER TABLE Listing ADD CONSTRAINT Listing_Hosts
    FOREIGN KEY (Host_Users_username)
    REFERENCES Host (Users_username)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Listing_Properties (table: Listing)
ALTER TABLE Listing ADD CONSTRAINT Listing_Properties
    FOREIGN KEY (Properties_property_id)
    REFERENCES Properties (property_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Page_Hosts (table: Page)
ALTER TABLE Page ADD CONSTRAINT Page_Hosts
    FOREIGN KEY (Host_Users_username)
    REFERENCES Host (Users_username)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Private_room_Rooms (table: Private_room)
ALTER TABLE Private_room ADD CONSTRAINT Private_room_Rooms
    FOREIGN KEY (Rooms_room_id)
    REFERENCES Rooms (room_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Properties_num_rooms (table: Properties)
ALTER TABLE Properties ADD CONSTRAINT Properties_num_rooms
    FOREIGN KEY (num_rooms_num_rooms)
    REFERENCES num_rooms (num_rooms)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Rooms_Listing (table: Rooms)
ALTER TABLE Rooms ADD CONSTRAINT Rooms_Listing
    FOREIGN KEY (Listing_listing_id)
    REFERENCES Listing (listing_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Shared_room_Rooms (table: Shared_room)
ALTER TABLE Shared_room ADD CONSTRAINT Shared_room_Rooms
    FOREIGN KEY (Rooms_room_id)
    REFERENCES Rooms (room_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

