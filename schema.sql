

create table menu_item(
 id int IDENTITY(1,1) PRIMARY KEY,
 name varchar(65) not null,
 price decimal(10,2) not null,
 active varchar(3) not null,
 date_of_launch date not null,
 category varchar(max)not null,
 free_delivery varchar(3) not null 
)

create table [user] (
 id int IDENTITY(1,1) PRIMARY KEY,
 no_cart_item int
)
create table cart(
 id int IDENTITY(1,1) PRIMARY KEY,
 [user_id] int FOREIGN KEY REFERENCES [user](id),
 menu_item_id int FOREIGN KEY REFERENCES menu_item(id) , 
 name varchar(65) not null,
 free_delivery varchar(3)not null,
 price decimal(10,2)not null
)