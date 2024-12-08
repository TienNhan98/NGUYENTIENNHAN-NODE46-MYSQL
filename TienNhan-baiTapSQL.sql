-- Bảng user

CREATE TABLE IF NOT EXISTS users (
	usersID INT PRIMARY KEY AUTO_INCREMENT,
	fullName VARCHAR(255),
	email VARCHAR(255),
	passWord VARCHAR(255)
)

-- Bảng res
CREATE TABLE IF NOT EXISTS restaurant (
	resID INT PRIMARY KEY AUTO_INCREMENT,
	resName VARCHAR(255),
	image VARCHAR(255),
	`desc` VARCHAR(255)
)

-- Bảng FoodType
CREATE TABLE IF NOT EXISTS foodType (
	typeID INT PRIMARY KEY AUTO_INCREMENT,
	typeName VARCHAR(255)
)

-- Bảng Food

CREATE TABLE IF NOT EXISTS food (
	foodID INT PRIMARY KEY AUTO_INCREMENT,
	foodName VARCHAR(255),
	image VARCHAR(255),
	price DOUBLE,
	`desc` VARCHAR(255),
	typeID INT,
	FOREIGN KEY (typeID) REFERENCES foodType(typeID)
)

-- Bảng subFood

CREATE TABLE IF NOT EXISTS subFood (
	subID INT PRIMARY KEY AUTO_INCREMENT,
	subName VARCHAR(255),
	subPrice DOUBLE,
	foodID INT,
	FOREIGN KEY (foodID) REFERENCES food(foodID)
)

-- Bảng Order

CREATE TABLE IF NOT EXISTS orders (
	ordersID INT PRIMARY KEY AUTO_INCREMENT,
	usersID INT,
	foodID INT,
	amount INT,
	price DOUBLE,
	code VARCHAR (255),
	arrSubID VARCHAR (255),
	FOREIGN KEY (usersID) REFERENCES users(usersID),
	FOREIGN KEY (foodID) REFERENCES food(foodID)
)
ALTER TABLE orders DROP COLUMN price;

-- Bảng rateRes

CREATE TABLE IF NOT EXISTS rateRes (
	rateResID INT PRIMARY KEY AUTO_INCREMENT,
	usersID INT,
	resID INT,
	amount INT,
	dateRate DATETIME,
	FOREIGN KEY (usersID) REFERENCES users(usersID),
	FOREIGN KEY (resID) REFERENCES restaurant(resID)
)

-- Bảng likeRes

CREATE TABLE IF NOT EXISTS likeRes (
	likeResID INT PRIMARY KEY AUTO_INCREMENT,
	usersID INT,
	resID INT,
	dateLike DATETIME,
	FOREIGN KEY (usersID) REFERENCES users(usersID),
	FOREIGN KEY (resID) REFERENCES restaurant(resID)
)


-- Data

-- Thêm dữ liệu vào bảng users
INSERT INTO users (fullName, email, passWord) VALUES
('John Doe', 'john.doe@example.com', 'password123'),
('Jane Smith', 'jane.smith@example.com', 'securepass'),
('Alice Brown', 'alice.brown@example.com', 'alice2023'),
('Charlie Davis', 'charlie.davis@example.com', 'charlie123'),
('Emily Wilson', 'emily.wilson@example.com', 'emilysecure'),
('Michael Green', 'michael.green@example.com', 'mikepass'),
('Laura Johnson', 'laura.johnson@example.com', 'laurapass'),
('Sophia King', 'sophia.king@example.com', 'sophiapass'),
('James White', 'james.white@example.com', 'jamespass'),
('David Lee', 'david.lee@example.com', 'davidsecure');

-- Thêm dữ liệu vào bảng restaurant
INSERT INTO restaurant (resName, image, `desc`) VALUES
('Burger Palace', 'burger.jpg', 'Delicious burgers and fries'),
('Pizza Hub', 'pizza.jpg', 'Wide variety of pizzas'),
('Sushi Corner', 'sushi.jpg', 'Authentic Japanese sushi'),
('BBQ Grill', 'bbq.jpg', 'Best barbecue in town'),
('Veggie Delight', 'veggie.jpg', 'Healthy vegetarian options'),
('Seafood Haven', 'seafood.jpg', 'Fresh seafood dishes'),
('Taco Fiesta', 'taco.jpg', 'Mexican tacos and more'),
('Pasta Heaven', 'pasta.jpg', 'Italian pasta specialties'),
('Dessert Land', 'dessert.jpg', 'Sweet treats for everyone'),
('Coffee Time', 'coffee.jpg', 'Relax with a cup of coffee');

-- Thêm dữ liệu vào bảng foodType
INSERT INTO foodType (typeName) VALUES
('Fast Food'),
('Seafood'),
('Vegetarian'),
('Dessert'),
('Beverage'),
('Mexican'),
('Italian'),
('Japanese'),
('Grill'),
('Healthy');

-- Thêm dữ liệu vào bảng food
INSERT INTO food (foodName, image, price, `desc`, typeID) VALUES
('Cheeseburger', 'cheeseburger.jpg', 5.99, 'Juicy cheeseburger', 1),
('Pepperoni Pizza', 'pepperoni.jpg', 8.99, 'Classic pizza', 7),
('Salmon Sushi', 'salmon_sushi.jpg', 12.99, 'Fresh salmon sushi', 8),
('BBQ Ribs', 'bbq_ribs.jpg', 15.99, 'Smoked BBQ ribs', 9),
('Garden Salad', 'garden_salad.jpg', 6.99, 'Fresh garden salad', 3),
('Chocolate Cake', 'chocolate_cake.jpg', 4.99, 'Rich chocolate cake', 4),
('Iced Latte', 'iced_latte.jpg', 3.99, 'Cool coffee drink', 5),
('Tacos Al Pastor', 'tacos.jpg', 7.99, 'Mexican tacos', 6),
('Spaghetti Bolognese', 'spaghetti.jpg', 10.99, 'Classic Italian pasta', 7),
('Grilled Chicken', 'grilled_chicken.jpg', 9.99, 'Perfectly grilled chicken', 9);

-- Thêm dữ liệu vào bảng subFood
INSERT INTO subFood (subName, subPrice, foodID) VALUES
('Extra Cheese', 0.99, 1),
('Bacon', 1.49, 1),
('Olives', 0.79, 2),
('Mushrooms', 0.89, 2),
('Wasabi', 0.50, 3),
('Soy Sauce', 0.50, 3),
('Garlic Bread', 1.99, 9),
('BBQ Sauce', 0.99, 4),
('Croutons', 0.79, 5),
('Vanilla Ice Cream', 1.49, 6);

-- Thêm dữ liệu vào bảng orders
INSERT INTO orders (usersID, foodID, amount, code, arrSubID) VALUES
(1, 1, 2, 'ORDER123', '1,2'),
(2, 2, 1, 'ORDER124', '3,4'),
(3, 3, 3, 'ORDER125', '5,6'),
(4, 4, 1, 'ORDER126', '8'),
(5, 5, 2, 'ORDER127', '9'),
(6, 6, 1, 'ORDER128', '10'),
(7, 7, 4, 'ORDER129', ''),
(8, 8, 2, 'ORDER130', ''),
(9, 9, 1, 'ORDER131', '7'),
(10, 10, 3, 'ORDER132', '');

-- Thêm dữ liệu vào bảng rateRes
INSERT INTO rateRes (usersID, resID, amount, dateRate) VALUES
(1, 1, 5, '2024-12-01 12:00:00'),
(2, 2, 4, '2024-12-02 13:00:00'),
(3, 3, 3, '2024-12-03 14:00:00'),
(4, 4, 4, '2024-12-04 15:00:00'),
(5, 5, 5, '2024-12-05 16:00:00'),
(6, 6, 4, '2024-12-06 17:00:00'),
(7, 7, 3, '2024-12-07 18:00:00'),
(8, 8, 2, '2024-12-08 19:00:00'),
(9, 9, 5, '2024-12-09 20:00:00'),
(10, 10, 4, '2024-12-10 21:00:00');

-- Thêm dữ liệu vào bảng likeRes
INSERT INTO likeRes (usersID, resID, dateLike) VALUES
(1, 1, '2024-12-01 12:00:00'),
(2, 2, '2024-12-02 13:00:00'),
(3, 3, '2024-12-03 14:00:00'),
(4, 4, '2024-12-04 15:00:00'),
(5, 5, '2024-12-05 16:00:00'),
(6, 6, '2024-12-06 17:00:00'),
(7, 7, '2024-12-07 18:00:00'),
(8, 8, '2024-12-08 19:00:00'),
(9, 9, '2024-12-09 20:00:00'),
(10, 10, '2024-12-10 21:00:00');

-- update order, rate, like

INSERT INTO orders (usersID, foodID, amount, code, arrSubID) VALUES
(2, 5, 1, 'ORDER133', '9,10'),
(3, 4, 2, 'ORDER134', '8'),
(4, 6, 3, 'ORDER135', ''),
(5, 7, 1, 'ORDER136', '7'),
(6, 9, 2, 'ORDER137', ''),
(7, 10, 3, 'ORDER138', ''),
(8, 1, 2, 'ORDER139', '1,2'),
(9, 3, 1, 'ORDER140', '5,6'),
(10, 8, 4, 'ORDER141', ''),
(1, 2, 1, 'ORDER142', '3,4');

INSERT INTO rateRes (usersID, resID, amount, dateRate) VALUES
(1, 5, 5, '2024-12-11 12:30:00'),
(2, 3, 4, '2024-12-11 14:15:00'),
(3, 1, 3, '2024-12-11 15:00:00'),
(4, 7, 2, '2024-12-11 16:20:00'),
(5, 9, 4, '2024-12-11 17:45:00'),
(6, 6, 5, '2024-12-11 18:30:00'),
(7, 8, 3, '2024-12-11 19:10:00'),
(8, 4, 2, '2024-12-11 20:50:00'),
(9, 2, 4, '2024-12-11 21:30:00'),
(10, 10, 5, '2024-12-11 22:10:00');

INSERT INTO likeRes (usersID, resID, dateLike) VALUES
(1, 4, '2024-12-11 12:00:00'),
(2, 6, '2024-12-11 13:00:00'),
(3, 2, '2024-12-11 14:00:00'),
(4, 8, '2024-12-11 15:00:00'),
(5, 10, '2024-12-11 16:00:00'),
(6, 5, '2024-12-11 17:00:00'),
(7, 9, '2024-12-11 18:00:00'),
(8, 7, '2024-12-11 19:00:00'),
(9, 1, '2024-12-11 20:00:00'),
(10, 3, '2024-12-11 21:00:00');

INSERT INTO likeRes (usersID, resID, dateLike) VALUES
(1, 4, '2024-12-11 12:10:00'),
(2, 6, '2024-12-11 13:10:00'),
(3, 2, '2024-12-11 14:10:00'),
(4, 8, '2024-12-11 15:10:00'),
(5, 10, '2024-12-11 16:10:00');

INSERT INTO likeRes (usersID, resID, dateLike) VALUES
(4, 8, '2024-12-11 15:10:00'),
(5, 10, '2024-12-11 16:10:00');


INSERT INTO orders (usersID, foodID, amount, code, arrSubID) VALUES

(8, 1, 2, 'ORDER143', '1,2'),

(8, 1, 2, 'ORDER144', '5,6');



-- CÂU 1: 5 người đã like nhà hàng nhiều nhất

SELECT *
FROM likeRes

SELECT users.usersID, users.fullName, COUNT(likeRes.likeResID) AS likeCount
FROM likeRes
INNER JOIN users ON likeRes.usersID = users.usersID
GROUP BY likeRes.usersID, users.fullName
ORDER BY likeCount DESC
LIMIT 5;

-- CÂU 2: 2 nhà hàng có lượt like nhiều nhất

SELECT *
FROM likeRes

SELECT restaurant.resID, restaurant.resName, COUNT(likeRes.likeResID) AS ResLike
FROM likeRes 
INNER JOIN restaurant ON likeRes.resID = restaurant.resID
GROUP BY likeRes.resID, restaurant.resName
ORDER BY ResLike DESC
LIMIT 2;

-- CÂU 3: Tìm người đã đặt hàng nhiều nhất.

SELECT *
FROM orders 

SELECT users.usersID, users.fullName, COUNT(orders.ordersID) AS orderCount
FROM orders 
INNER JOIN users ON orders.usersID = users.usersID 
GROUP BY orders.usersID, users.fullName
ORDER BY orderCount DESC
LIMIT 1;

-- CÂU 4: Tìm người dùng không hoạt động trong hệ thống

SELECT *
FROM users 

SELECT users.usersID, users.fullName
FROM users
LEFT JOIN orders ON users.usersID = orders.usersID
LEFT JOIN rateRes ON users.usersID = rateRes.usersID
LEFT JOIN likeRes ON users.usersID = likeRes.usersID
WHERE orders.ordersID IS NULL
AND rateRes.rateResID IS NULL
AND likeRes.likeResID IS NULL;







