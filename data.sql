--1. View Menu Item List Admin
insert into menu_item values('Sandwich','99.00','yes','2017-03-15','Main Course','Yes');
insert into menu_item values('Burger','129.00','yes','2017-12-23','Main Course','No');
insert into menu_item values('Pizza','149.00','yes','2017-08-21','Main Course','No');
insert into menu_item values('French Fries','57.00','No','2017-07-02','Sataters','Yes');
insert into menu_item values('Chocolate Brownie','32.00','yes','2022-11-02','Dessert','Yes');

select name,price,active,CONVERT(varchar,date_of_launch,103),category,free_delivery from menu_item 
GO 

--2.View Menu Item List Customer(TYUC002)

select name,price,active,CONVERT(varchar,date_of_launch,103),category,free_Delivery from menu_item where active='yes' and DATEDIFF(DAY,Date_of_Launch,GETDATE())>0
GO
--3.Edit Menu Item (TYUC003)

create PROCEDURE menu_item_edit( @item_id int,@item_name varchar(max),@item_price decimal(10,2),
@item_active varchar(3),@item_date_of_launch date,@item_category varchar(max),
@item_free_delivery varchar(3) ) as
begin
update menu_item
set name = @item_name,
price = @item_price,
active = @item_active,
date_of_launch = @item_date_of_launch,
category = @item_category,
free_delivery = @item_free_delivery where id=@item_id
end
GO

--4.Add to Cart (TYUC004)

insert into [user] (no_cart_item) select COUNT(id) from cart where [user_id]=1;
insert into [user] (no_cart_item)select COUNT(id) from cart where [user_id]=2;
GO
create PROCEDURE cart_insert (@user_id int,@item_id int) as
begin
insert into cart ([user_id],menu_item_id)values(@user_id,@item_id);
end
GO
--5.View Cart (TYUC005)
create PROCEDURE cart_select (@user_id int) as 
 begin
 select name,free_delivery,price from menu_item m JOIN cart c on m.id=c.menu_item_id where c.[user_id]=@id;
 select SUM(price) as 'Total Price' from cart where [user_id]=@id;
 end
 GO  
 --6.Remove Item from Cart (TYUC006)
 create PROCEDURE cart_delete(@user_id int,@item_id int) as
 begin
 delete from cart where [user_id]=@user_id and menu_item_id=@item_id
 end
  GO 
  
  
