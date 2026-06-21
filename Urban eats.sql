Create database Urban_Eats;

use Urban_Eats;

-- CREATING OUTLINE OF TABLES
-- DEFINING TABLES

create table Outlets(
Outlet_id int primary key,
Outlet_name varchar(100) not null,
Location varchar(100) not null,
Contact varchar(20) unique,
Status varchar (50) not null
);

create table Staff(
Staff_id int primary key,
Name varchar(100) not null,
Gender varchar(100) not null,
Contact varchar(20) unique,
Email varchar(100) unique,
Role varchar (50) not null,
Outlet_id int, 
FOREIGN KEY (Outlet_id) REFERENCES Outlets(Outlet_id)
);

create table Shift(
Shift_id int primary key,
Staff_id int,
Outlet_id int,
Start_date Date,
Start_time Time,
End_time Time, 
Shift_duration int,
FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id),
FOREIGN KEY (Outlet_id) REFERENCES Outlets(Outlet_id)
);

create table Staff_Shift(
Staff_id int,
Shift_id int,
Employment_status varchar(50),
FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id),
FOREIGN KEY (Shift_id) REFERENCES Shift(Shift_id)
);

create table Customers(
Customer_id int primary key,
Cust_name varchar(100) not null,
Email varchar(100) not null,
Contact varchar(20) unique
);

create table Reservations(
Reservation_id int primary key,
Customer_id int,
Outlet_id int,
Reservation_date Date,
Party_size int,
Table_no int not null,
Reservation_time Time,
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id),
FOREIGN KEY (Outlet_id) REFERENCES Outlets(Outlet_id)
);

create table Product_category(
ProductCat_id int Primary Key,
Category_name varchar(50)
);

create table Products(
Product_id int Primary Key,
ProductCat_id int,
Prod_name varchar(50),
Price int,
Ingredients varchar(200),
FOREIGN KEY (ProductCat_id) REFERENCES Product_category(ProductCat_id)
);

create table Orders(
Order_id int primary key,
Customer_id int,
Outlet_id int, 
Order_date Date,
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id),
FOREIGN KEY (Outlet_id) REFERENCES Outlets(Outlet_id)
);

create table Order_details(
Orderdetails_id int primary key,
Order_id int,
Product_id int, 
Quantity int,
Bill_amount int not null ,
FOREIGN KEY (Order_id) REFERENCES Orders(Order_id),
FOREIGN KEY (Product_id) REFERENCES Products(Product_id)
);

Alter table Staff_Shift
ADD CONSTRAINT pk_staff_shift      -- Adding composite primary key
PRIMARY KEY (Staff_id, Shift_id);

ALTER TABLE Shift
DROP FOREIGN KEY shift_ibfk_1;      -- Removing foreign key - duplicatation

Alter table Shift
drop column Staff_id;

ALTER TABLE Shift
ADD COLUMN Staff_id int,
ADD FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id);

Drop table Payments;

Alter table Order_details
DROP COLUMN Orderdetails_id;


Alter table Order_details            -- Adding composite primary key 
ADD CONSTRAINT pk_orderproduct_id 
PRIMARY KEY (Order_id, Product_id);

CREATE TABLE Payments (
Pay_id int primary key,
Order_id int not null,
Payment_method varchar(50),
FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);

-- ADDING VALUES IN TABLES

Insert into Outlets( Outlet_id ,Outlet_name, Location, Contact, Status)
values ( 1000 , 'Urban Eats Central' , 'Pyrmont 2009', '0443245367', 'ACTIVE'),
( 2000 , 'Urban Eats Hub' , 'Darling Harbour 2000', '0483245566', 'ACTIVE'),
( 3000 , 'Urban Eats Alley' , 'Chippendale 2008', '0477745933', 'ACTIVE');

Insert into Staff( Staff_id ,Name, Gender, Contact, Email , Role, Outlet_id)
values ( 101 , 'Chloe M' , 'Female', '0422245969', 'chloe1@gmail.com','Chef',1000),
( 102 , 'Jane S' , 'Female', '0413284444', 'sjane@gmail.com', 'Waiter',1000),
( 201 , 'Mary L' , 'Female', '0456123876', 'mary33@gmail.com','Chef',2000),
( 301, 'Lucy R' , 'Female', '0422001002', 'lucy@gmail.com','Chef',3000),
( 302 , 'Tom F' , 'Male', '0411001001', 'tom@gmail.com','Waiter',3000),
( 202 , 'Bob T' , 'Male', '0433001003', 'bob@gmail.com','Chef',2000),
( 203 , 'Ross E' , 'Male', '0444001004', 'ross4@gmail.com','Waiter',2000),
( 103 , 'Charlie H' , 'Female', '0444551005', 'charlie@gmail.com','Manager',1000),
( 104 , 'Alan H' , 'Male', '0411001009', 'alanh@gmail.com','Allrounder',1000),
( 303, 'Tate M' , 'Female', '0488001008', 'tatem@gmail.com','Chef',3000),

( 105, 'Karen G' , 'Female', '0411002001', 'karen@gmail.com','Chef',1000),
( 106, 'Leo F' , 'Male', '0411002002', 'leo@gmail.com','Waiter',1000),
( 107, 'Maria S' , 'Female', '0411002003', 'maria@gmail.com','Chef',1000),
( 108, 'Scott H' , 'Male', '0411002004', 'scott@gmail.com','Waiter',1000),
( 109, 'Paul E' , 'Female', '0411002005', 'paul@gmail.com','Allrounder',1000),
( 110, 'Ryan K' , 'Female', '0411002006', 'ryan@gmail.com','Allrounder',1000),
( 204, 'Sophie Y' , 'Female', '0411002007', 'sophie@gmail.com','Chef',2000),
( 205, 'Olivia A' , 'Female', '0411002888', 'olivia@gmail.com','Waiter',2000),
( 206, 'Zack H' , 'Male', '0411002099', 'zack@gmail.com','Manager',2000),
( 207, 'Cody K' , 'Male', '0411002010', 'cody@gmail.com','Waiter',2000),

( 208, 'Wendy R' , 'Female', '0422002011', 'wendyr@gmail.com','Allrounder',2000),
( 209, 'Chuck u' , 'Male', '0422002012', 'chuck@gmail.com','Allrounder',2000),
( 210, 'Lara A' , 'Female', '0422002013', 'lara@gmail.com','Allrounder',2000),
( 304, 'Chelsea L' , 'Female', '0411003001', 'chelsea@gmail.com','Manager',3000),
( 305, 'Jake T' , 'Male', '0411003002', 'jake@gmail.com','Allrounder',3000),
( 306, 'Amelia T' , 'Female', '0411003003', 'amelia@gmail.com','Waiter',3000),
( 307, 'Victor P' , 'Male', '0411003004', 'victorp@gmail.com','Allrounder',3000);

Insert into Shift( Shift_id ,Staff_id, Outlet_id, Start_date , Start_time , End_time, Shift_duration)
values 
( 1 , 101 , 1000, '2024-10-01', '7:00','15:00',8 ),
( 2 , 105 , 1000, '2024-09-01', '7:00','15:00',8),
( 3 , 103 , 1000, '2024-09-01', '10:00','16:00',6),
( 4 , 106 , 1000, '2024-10-01', '7:00','15:00',8),
( 5 , 108 , 1000, '2024-09-01', '7:00','15:00',8 ),
( 6 , 102 , 1000, '2024-11-01', '7:00','15:00',8 ),
( 7 , 109 , 1000, '2024-12-01', '10:00','16:00',8 ),
( 8 , 110 , 1000, '2024-12-01', '12:00','16:00',6 ),

( 9 , 201 , 2000, '2024-06-01', '7:00','15:00',8 ),
( 10 , 202 ,2000, '2024-06-01', '7:00','15:00',8 ),
( 11 , 204 ,2000, '2024-10-01', '7:00','15:00',8 ),
( 12 , 206 ,2000, '2024-06-01', '10:00','16:00',6 ),
( 13 , 205 , 2000, '2024-06-01', '7:00','15:00',8 ),
( 14 , 207, 2000, '2024-07-01', '9:00','16:00',9 ),
( 15 , 208 , 2000, '2024-10-01', '12:00','16:00',4 ),

( 16 , 304 , 3000, '2025-01-01', '10:00','15:00',5 ),
( 17 , 301 , 3000, '2025-01-01', '7:00','15:00',8 ),
( 18 , 303 , 3000, '2025-04-01', '7:00','15:00',8 ),
( 19 , 305 , 3000, '2025-01-01', '8 :00','13:00',5 ),
( 20 , 306 , 3000, '2025-02-01', '9:00','16:00',7),
( 21 , 307 , 3000, '2025-04-01', '8:00','13:00',5 );

Insert into Staff_Shift (Staff_id, Shift_id, Employment_status)
Values
(101, 1, 'Full-time'),
(105, 2, 'Part-time'),
(103, 3, 'Full-time'),
(106, 4, 'Part-time'),
(102, 6,' '),
(106, 8, 'Part-time'),
(108, 5, 'Part-time'),
(110, 10, 'Casual'),
(204, 11, 'Full-time'),
(206, 12, 'Full-time'),
(207, 14, 'Part-time'),
(208, 15, 'Casual'),
(301, 17, 'Full-time'),
(305, 19, 'Casual'),
(307, 21, 'Part-time'),
(303, 18 , ' '),
(306 , 20, ' ') 
;

Insert into Product_category (ProductCat_id, Category_name) values
(01, 'Beverages'),
(02, 'Coffees'),
(03, 'Appetizers'),
(04, 'Salads'),
(05, 'Mains'),
(06, 'Sides'),
(07, 'Bakery'),
(08, 'Desserts');


Insert into Products(Product_id, ProductCat_id, Prod_name, Price, Ingredients) values
-- Coffees (5 types, hot and cold available) 
(111, 02, 'Espresso', 4, 'Coffee beans, water'),
(112, 02, 'Cappuccino', 5, 'Espresso, steamed milk, foam'),
(113, 02, 'Iced Latte', 6, 'Espresso, cold milk, ice'),
(114, 02, 'Mocha', 7, 'Espresso, chocolate syrup, milk'),
(115, 02, 'Iced Cold Brew', 7, 'Cold brewed coffee, water'),

-- Beverages (5 types)
(116, 01, 'Lemonade', 4, 'Water, lemon juice, sugar'),
(117, 01, 'Iced Tea', 6, 'Tea, ice, lemon'),
(118, 01, 'Orange Smoothie', 8, 'Orange, yogurt, honey'),
(119, 01, 'Strawberry Smoothie', 8, 'Strawberries, milk, ice'),
(200, 01, 'Mango Juice', 6, 'Mango, water, sugar'),

-- Appetizers (4 types: 1 veg, 2 chicken, 1 pork)
(331, 03, 'Vegetable Spring Rolls', 10, 'Cabbage, carrot, rice paper, sauce'),
(332, 03, 'Chicken Wings', 15, 'Chicken wings, spices, sauce'),
(333, 03, 'Chicken Satay', 17, 'Chicken skewers, peanut sauce'),
(334, 03, 'Pork Dumplings', 17, 'Pork, vegetables, dough'),

-- Salads (3 types, meat optional)
(441, 04, 'Caesar Salad', 17, 'Lettuce, croutons, parmesan, chicken'),
(442, 04, 'Greek Salad', 17, 'Tomato, cucumber, feta, olives'),
(443, 04, 'Cobb Salad', 20, 'Lettuce, bacon, chicken, egg, blue cheese'),

-- Mains : (Lasagna) Vegetarian and Meat
(550, 05, 'Vegetarian Lasagna', 18, 'Lasagna sheets, ricotta, spinach, tomato sauce, cheese'),
(551, 05, 'Meat Lasagna', 20, 'Lasagna sheets, ground beef, tomato sauce, cheese'),

-- (Burgers: Chicken, Beef, Vegan)
(552, 05, 'Chicken Burger', 15, 'Chicken patty, lettuce, tomato, bun'),
(553, 05, 'Beef Burger', 17, 'Beef patty, lettuce, tomato, cheese, bun'),
(554, 05, 'Vegan Burger', 16, 'Veggie patty, lettuce, tomato, vegan bun'),

-- (Pizza: Margarita, Pork, Chicken)
(555, 05, 'Margherita Pizza', 16, 'Tomato sauce, mozzarella, basil'),
(556, 05, 'Pork Pizza', 18, 'Tomato sauce, mozzarella, pork, onions'),
(557, 05, 'Chicken Pizza', 18, 'Tomato sauce, mozzarella, grilled chicken, peppers'),

-- (Steak Options)
(558, 05, 'Grilled Sirloin Steak', 25, 'Sirloin steak, herbs, garlic butter'),
(559, 05, 'Rib-eye Steak', 28, 'Rib-eye steak, seasoning, side salad'),

-- (Pasta (2 types))
(660, 05, 'Spaghetti Carbonara', 16, 'Spaghetti, eggs, pancetta, cheese, pepper'),
(661, 05, 'Penne Arrabiata', 15, 'Penne pasta, tomato sauce, chili peppers, garlic'),


-- Sides (3 options)
(662, 06, 'French Fries', 10, 'Potatoes, salt, oil'),
(663, 06, 'Onion Rings', 12, 'Onions, batter, oil'),
(664, 06, 'Coleslaw', 8, 'Cabbage, carrot, mayo'),

-- Bakery (6 items)
(771, 07, 'Donuts', 3, 'Flour, sugar, oil, glaze'),
(772, 07, 'Banana Bread', 5, 'Bananas, flour, sugar, eggs'),
(773, 07, 'Fruit Tart', 6, 'Fruit, cream, pastry'),
(774, 07, 'Tea Cake', 5, 'Flour, sugar, eggs'),
(775, 07, 'Cookies', 2, 'Flour, sugar, butter, chocolate chips'),
(776, 07, 'Muffins', 4, 'Flour, sugar, eggs, blueberries'),

-- Desserts (3 options)
(881, 08, 'Chocolate Cake', 17, 'Chocolate, flour, sugar, eggs'),
(882, 08, 'Cheesecake', 20, 'Cheese, sugar, biscuit base'),
(883, 08, 'Ice Cream Sundae', 17, 'Ice cream, syrup, nuts');

Alter table Customers
Modify column Contact VARCHAR(255);

Insert into Customers(Customer_id , Cust_name, Email, Contact) values
(1001, 'Cher Johnson', 'cher.johnson1@gmail.com', '0412000011'),
(1002, 'Jose Smith', 'jose.smith1@gmail.com', '0412000013'),
(1003, 'Carol White', 'carol.white1@gmail.com', '0412000014'),
(1004, 'David Brown', 'david.brown1@gmail.com', '0412000015'),
(1005, 'Eva Green', 'eva.green1@gmail.com', '0412000017'),
(1009, 'Gigi Lee', 'grace.lee@gmail.com', '0412000018'),
(1010, 'Hall Clark', 'henry.clark@gmail.com', '0412000019'),

(1011, 'Isabella Kim', 'isabella.kim@gmail.com', '0412000020'),
(1012, 'Jack Davis', 'jack.davis@gmail.com', '0412000021'),
(1014, 'Dolly Blue', 'dolly.blue2@gmail.com', '0412000099'),
(1015, 'Adam John', 'adam.john3@gmail.com', '0412000051'),
(1016, 'Cami Scott', 'cami.scott@gmail.com', '0412000026'),
(1017, 'Dave King', 'dave.king@gmail.com', '0412000027'),
(1018, 'Mary Lopez', 'mary.lopez@gmail.com', '0412000028'),
(1019, 'Nate Young', 'nate.young@gmail.com', '0412000029'),
(1020, 'Will Smith', 'will.smith3@gmail.com', '0412000055'),

(1021, 'Olive Adams', 'olive.adams@gmail.com', '0412000030'),
(1022, 'Phil Baker', 'phil.baker@gmail.com', '0412000035'),
(1023, 'Quinn Wright', 'quinn.wright@gmail.com', '0412000040'),
(1024, 'Rian Hill', 'rian.hill@gmail.com', '0412000045'),
(1025, 'Sophie Allen', 'sophie.allen@gmail.com', '0412000043'),

(1026, 'Lewis Tommy', 'lewis.tommy@gmail.com', '0412000038'),
(1027, 'Uma Martin', 'uma.martin@gmail.com', '0412000033'),
(1028, 'Max Nelson', 'max.nelson@gmail.com', '0412000077'),
(1029, 'Willow Moore', 'willow.moore@gmail.com', '0412000088'),
(1030, 'George Price', 'george.price@gmail.com', '0412000022'),

(1031, 'Yvonne Reed', 'yvonne.reed@gmail.com', '0413000010'),
(1032, 'Zachary Wood', 'zachary.wood@gmail.com', '0413000008'),
(1033, 'Amy Hill', 'amy.hill@gmail.com', '0413000006'),
(1034, 'Benjamin Parker', 'benjamin.parker@gmail.com', '0413000005'),
(1035, 'Charlotte Evans', 'charlotte.evans@gmail.com', '0413000001'),
(1036, 'Danny Roberts', 'danny.roberts@gmail.com', '0413000003'),
(1037, 'Gail Love', 'gail.love2@gmail.com', '0412000057'),

(1041, 'Soph Allli', 'soph.alli2@gmail.com', '0412000090'),
(1042, 'Lew Hamilton', 'lew.hamilton@gmail.com', '0412000091'),
(1043, 'Martin Luther', 'martin.luther2@gmail.com', '0412000093'),
(1045, 'Milleie Brown', 'milllie.brown2@gmail.com', '0412000097');

insert into Reservations(Reservation_id , Customer_id , Outlet_id , Reservation_date , Party_size, Table_no, Reservation_time) values
(2001 , 1001, 1000 , '2025-08-22', 2, 2, '14:00'),
(2002 , 1003, 1000 , '2025-08-23', 2, 4, '13:00'),
(2003 , 1005, 1000 , '2025-08-23', 4, 5, '12:00'),
(2004 , 1010, 2000 , '2025-08-23', 4, 3, '12:00'),
(2005 , 1015, 2000 , '2025-08-23', 3, 4, '13:00'),
(2006 , 1018, 2000 , '2025-08-24', 3, 7, '13:00'),
(2007 , 1021, 2000 , '2025-08-24', 5, 6, '11:00'),
(2008 , 1023, 3000 , '2025-08-22', 5, 1, '12:00'),
(2009 , 1033, 3000 , '2025-08-23', 2, 2, '13:00'),
(2010 , 1041, 3000 , '2025-08-24', 2, 4, '14:00'),
(2011 , 1045, 1000 , '2025-08-28', 3, 2, '14:00'),
(2012 , 1036, 2000 , '2025-08-28', 2, 5, '13:00');

Insert into Orders (Order_id, Customer_id, Outlet_id, Order_date) values
(01, 1001, 1000, '2025-08-22'),
(02, 1002, 1000, '2025-08-22'),
(03, 1003, 1000, '2025-08-23'),
(04, 1004, 1000, '2025-08-23'),
(05, 1005, 1000, '2025-08-23'),
(06, 1032, 1000, '2025-08-24'),
(07, 1034, 1000, '2025-08-24'),
(08, 1035, 1000, '2025-08-22'),
(09, 1037, 1000, '2025-08-24'),
(010, 1010, 2000, '2025-08-23'),

(011, 1011, 2000, '2025-08-22'),
(012, 1012, 2000, '2025-08-22'),
(043, 1043, 2000, '2025-08-23'),
(014, 1014, 2000, '2025-08-23'),
(015, 1015, 2000, '2025-08-23'),
(016, 1016, 2000, '2025-08-24'),
(017, 1017, 2000, '2025-08-24'),
(018, 1018, 2000, '2025-08-24'),
(019, 1019, 2000, '2025-08-24'),
(020, 1036, 2000, '2025-08-28'),

(021, 1021, 2000, '2025-08-24'),
(022, 1045, 1000, '2025-08-28'),
(023, 1023, 3000, '2025-08-22'),
(024, 1024, 3000, '2025-08-22'),
(025, 1025, 3000, '2025-08-23'),
(026, 1026, 3000, '2025-08-23'),
(027, 1027, 3000, '2025-08-24'),
(028, 1028, 3000, '2025-08-24'),
(029, 1041, 3000, '2025-08-24'),
(030, 1033, 3000, '2025-08-23');

DELETE FROM Orders WHERE Order_id = 43;
INSERT INTO Orders (Order_id, Customer_id, Outlet_id, Order_date)
VALUES (13, 1043, 2000, '2025-08-23');

Insert into Order_details(Order_id, Product_id, Quantity, Bill_amount) values
(1, 117, 2, 12),     -- 2 iced tea 
(1, 662, 1, 10),     -- Fries
(1, 557, 1, 16),     -- Chicken Pizza 
(2, 112, 1, 5),      -- Cappuccino
(2, 772, 2, 10),     -- Banana Bread
(3, 556, 1, 7),      -- Pork pizza
(3, 333, 2, 34),     -- Chicken Satay
(3, 551, 1, 20),     -- Meat Lasagna
(3 , 200 , 3, 18),   -- Mango juice
(4, 118, 1, 8),      -- Orange Smoothie
(4, 552, 1, 15),     -- Chicken Burger
(5, 558, 1, 25),     -- Grilled Sirloin Steak
(5, 553, 1, 17),     -- Beef Burger
(5, 112, 2, 10),     -- 2 Cappuccinos @ $5
(5, 114, 2, 14),     -- 2 Mochas @ $7
(5, 881, 1, 17),     -- Chocolate Cake
(6, 555, 1, 16),     -- Margherita Pizza
(6, 663, 1, 12),     -- Onion Rings
(6 , 115 , 1 ,7),    -- Cold brew
(7, 553, 1, 17),     -- Beef Burger
(7, 773, 1, 6),      -- Fruit Tart
(8, 117, 2, 12),     -- Iced Tea
(8, 442, 1, 17),     -- Greek Salad
(9, 119, 1, 8),      -- Strawberry Smoothie
(9, 334, 2, 34),     -- Pork Dumplings
(10, 551, 1, 20),    -- Meat Lasagna
(10, 442, 1, 17),     -- Greek Salad
(10, 775, 3, 6),     -- Cookies
(10, 112, 2, 10),    -- 2 Cappuccinos @ $5
(11, 113, 1, 6),     -- Iced Latte
(11, 441, 1, 17),    -- Caesar Salad
(11, 114, 2, 14),     -- Mocha
(12, 114, 2, 14),    -- Mocha
(12, 771, 2, 6),     -- Donuts
(13, 660, 1, 16),    -- Spaghetti Carbonara
(13, 882, 1, 20),    -- Cheesecake
(14, 553, 2, 34),    -- Beef Burger
(15, 559, 1, 28),    -- Rib-eye Steak
(15, 664, 1, 8),     -- Coleslaw
(16, 661, 1, 15),    -- Penne Arrabiata
(16, 883, 1, 17),    -- Ice Cream Sundae
(17, 662, 1, 10),   -- French Fries
(17, 112, 1, 5),    -- Cappuccino
(17, 881, 1, 17),   -- Chocolate Cake
(18, 114, 2, 14),   -- 2 Mochas
(18, 333, 1, 17),   -- Chicken Satay
(18, 664, 1, 8),    -- Coleslaw
(19, 557, 1, 18),   -- Chicken Pizza
(19, 117, 1, 6),    -- Iced Tea
(19, 775, 3, 6),    -- 3 Cookies
(20, 558, 1, 25),   -- Grilled Sirloin Steak
(20, 553, 1, 17),   -- Beef Burger
(20, 118, 1, 8),    -- Orange Smoothie
(21, 442, 1, 17),   -- Greek Salad
(21,660 , 1 , 16),  -- Spagetthi Carbonara
(21, 557 , 1 , 18), -- Chicken Pizza
(21, 663 , 2 ,24),  -- Onion rings
(21, 115, 2, 14),   -- 2 Iced Cold Brew
(21, 118, 2, 16),   -- 2 Orange Smoothie
(21, 774, 1, 5),    -- Tea cake
(21, 882, 1, 5),    -- Cheesecake
(22, 553, 2, 34),   -- 2 Beef Burgers
(22, 662, 2, 20),   -- 2 French Fries
(22, 112, 2, 10),   -- 2 Cappuccinos
(23, 661, 1, 15),   -- Penne Arrabiata
(23, 551, 1, 20),    -- Meat `lasagna
(23, 117, 3, 18),    -- Iced Tea
(23, 883, 2, 34),   -- Ice Cream Sundae
(24, 553, 1, 17),   -- Beef Burger
(24, 119, 1, 8),    -- Strawberry Smoothie
(25, 554, 1, 16),   -- Vegan Burger
(25, 441, 1, 17),   -- Caesar Salad
(25, 116, 2, 8),    -- 2 Lemonades
(26, 555, 1, 16),   -- Margherita Pizza
(26, 332, 1, 15),   -- Chicken Wings
(26, 112, 1, 5),    -- Cappucino 
(26, 114, 1, 7),    -- Mocha
(27, 551, 1, 20),   -- Meat Lasagna
(27, 200, 1, 6),    -- Mango Juice
(27, 776, 2, 8),    -- 2 Muffins
(28, 553, 1, 17),   -- Beef Burger
(28, 662, 1, 10),   -- French Fries
(28, 118, 1, 8),    -- Orange smoothie  
(28, 882, 1, 20),   -- Cheesecake
(29, 333, 1, 17),   -- Chicken Satay
(29, 117, 1, 6),    -- Iced Tea
(29, 773, 1, 6),    -- Fruit Tart
(30, 559, 1, 28),   -- Rib-eye Steak
(30, 442, 1, 17),   -- Greek Salad
(30, 115, 1, 7),    -- Cold brew
(30, 881, 1, 17);   -- Chocolate Cake

insert into Payments (Pay_id , Order_id , Payment_method) values
(2001,  1,  'Cash'),
(2002,  2,  'Card'),
(2003,  3,  'Online'),
(2004,  4,  'Online'),
(2005,  5,  'Cash'),
(2006,  6,  'Card'),
(2007,  7,  'Online'),
(2008,  8,  'Cash'),
(2009,  9,  'Online'),
(2010, 10, 'Card'),

(2011, 11, 'Cash'),
(2012, 12, 'Card'),
(2013, 13, 'Online'),
(2014, 14, 'Cash'),
(2015, 15, 'Card'),
(2016, 16, 'Online'),
(2017, 17, 'Online'),
(2018, 18, 'Card'),
(2019, 19, 'Cash'),
(2020, 20, 'Online'),

(2021, 21, 'Card'),
(2022, 22, 'Online'),
(2023, 23, 'Cash'),
(2024, 24, 'Online'),
(2025, 25, 'Card'),
(2026, 26, 'Card'),
(2027, 27, 'Cash'),
(2028, 28, 'Card'),
(2029, 29, 'Online'),
(2030, 30, 'Cash');


-- CHALLENGE 1 - KEEPING UP WITH TECHNOLOGY 

SELECT 
    ou.Outlet_id,
    ou.Outlet_name,
    COUNT(*) AS Non_Online_Orders
FROM Orders o
JOIN Payments p ON o.Order_id = p.Order_id
JOIN Outlets ou ON o.Outlet_id = ou.Outlet_id
WHERE p.Payment_method <> 'Online'
GROUP BY o.Outlet_id, ou.Outlet_name
ORDER BY Non_Online_Orders DESC;

-- Observed high rate of offline transaction , Encouraging contactless payments speeds up service, enhances security, and boosts customer satisfaction.


Select r.Reservation_id , c.Cust_name,
       o.Order_id,
       p.Payment_method,
       r.Reservation_date,
       r.Reservation_time
From Reservations r
Join Customers c on r.Customer_id = c.Customer_id
Left Join Orders o ON r.Customer_id = o.Customer_id 
AND r.Outlet_id = o.Outlet_id
LEFT JOIN Payments p ON o.Order_id = p.Order_id
ORDER BY r.Reservation_date, r.Reservation_time;

-- This query demonstrates how digital integration can link reservations, orders, and payments, enabling more efficient and streamlined operations.

-- CHALLENGE 2 - ADAPTING TO CUSTOMER PREFERENCES - MENU , PRODUCTS

SELECT p.Prod_name,
       p.ProductCat_id,
       COUNT(od.Product_id) AS Total_Sold
FROM Order_details od
JOIN Products p ON od.Product_id = p.Product_id
GROUP BY p.Prod_name, p.ProductCat_id
ORDER BY Total_Sold DESC;

-- The query shows that the top-selling item is Beef Burger, while the least-selling item is Iced latte, highlighting customer preferences

SELECT *
FROM Product_category;

-- There is no kids special  or weekly special category on the menu - this can be updated to make the menu more attractive.

Select  pc.Category_name , count(*) as item_count
From Products p 
Join Product_category pc on p.ProductCat_id= pc.ProductCat_id
Group by p.ProductCat_id
Order by item_count asc;

-- Limited variety in desserts, sides, and salads suggests expanding these categories to attract more customers

-- CHALLENGE 3 - MAXIMIZE SALES AND PROFIT

Select ou.Outlet_name, SUM(Bill_amount) AS Total_Sales
From Order_details od
Join Orders o on o.Order_id = od.Order_id
Join Outlets ou on ou.Outlet_id = o.Outlet_id
GROUP BY ou.Outlet_id
ORDER BY Total_Sales DESC;

-- The above query displays total sales by outlet , with Urban Eats Hub being the top seller.

Select p.Prod_name, Sum(Quantity) as Total_quantity
From Order_details od
Join Products p on p.Product_id = od.Product_id
Group by Prod_name
Order by Total_Quantity ASC
Limit 5;

-- This query represents and review the five least-sold menu items which should be dealt with to improve sales and optimize overall menu profitability.

-- CHALLENGE 4 -  STAFFING GAPS - MISSING DATA FOR STAFF

Select s.Staff_id , s.Name , s.Role , ss.Shift_id, ss.Employment_status
From Staff s 
Join Staff_Shift ss on s.Staff_id = ss.Staff_id
Where ss.Employment_status is null or ss.Employment_status =' ';

-- This highlights that certain staff have no employment status recorded, which may create compliance and management issues for the business.

SELECT s.Staff_id,
    s.Name,
    s.Role,
    s.Outlet_id,
    COUNT(sh.Shift_id) AS Total_Shifts
FROM Staff s
LEFT JOIN Shift sh
    ON s.Staff_id = sh.Staff_id
GROUP BY s.Staff_id, s.Name, s.Role, s.Outlet_id
ORDER BY Total_Shifts ASC;

-- This query reveals that some staff are receiving few or no shifts, indicating issues with equitable shift allocation or scheduling fairness


-- CHALLENGE 5 -  LOW CUSTOMER FOOTFALL IN SPECIFIFC BRANCH

Select ou.Outlet_name, COUNT(DISTINCT Customer_id) AS Total_Customers, COUNT(Order_id) AS Total_Orders
From Orders o 
Join Outlets ou on ou.Outlet_id = o.Outlet_id
Group by ou.Outlet_id
Order by Total_Customers ASC;

-- Branch with Least Customer is Urban Eats Alley

Select ou.Outlet_name, p.Prod_name, sum(Quantity) as Total_itemsold
From Outlets ou 
Join Orders o on ou.Outlet_id = o.Outlet_id
Join Order_details od on o.Order_id = od.Order_id
Join Products p on p.Product_id = od.Product_id
Group by p.Prod_name,ou.Outlet_name
Having ou.Outlet_name = 'Urban Eats Alley'
Order by Total_itemsold desc;

-- Shows max  and min quantity item sold at urban eats alley- optimize menu 














