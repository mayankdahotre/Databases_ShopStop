-- Insert into Member (Shop Owners)
INSERT INTO member (name, image, age, email, contact_number) VALUES
('Rahul Sharma', NULL, 35, 'rahul.sharma@email.com', '9876543210'),
('Aisha Verma', NULL, 30, 'aisha.verma@email.com', '8765432109'),
('Vikram Patel', NULL, 40, 'vikram.patel@email.com', '7654321098'),
('Neha Agarwal', NULL, 32, 'neha.agarwal@email.com', '6543210987'),
('Ravi Mehta', NULL, 38, 'ravi.mehta@email.com', '5432109876'),
('Sneha Roy', NULL, 29, 'sneha.roy@email.com', '4321098765'),
('Arjun Singh', NULL, 36, 'arjun.singh@email.com', '3210987654'),
('Priya Das', NULL, 28, 'priya.das@email.com', '2109876543'),
('Manoj Nair', NULL, 42, 'manoj.nair@email.com', '1098765432'),
('Kavita Joshi', NULL, 34, 'kavita.joshi@email.com', '1987654321'),
('Rohit Malhotra', NULL, 31, 'rohit.malhotra@email.com', '2876543210'),
('Anjali Reddy', NULL, 27, 'anjali.reddy@email.com', '3765432109');

-- Insert into Shop
INSERT INTO shop (shop_id, name, address, contact, member_id) VALUES
('AB101', 'Fresh Mart', '123 Street A, City', '9988776655', 1),
('CD202', 'Daily Needs', '456 Street B, City', '8877665544', 2),
('EF303', 'Grocery World', '789 Street C, City', '7766554433', 3),
('GH404', 'Super Bazaar', '101 Street D, City', '6655443322', 4),
('IJ505', 'Family Store', '202 Street E, City', '5544332211', 5),
('KL606', 'Mega Mart', '303 Street F, City', '4433221100', 6),
('MN707', 'Quick Buy', '404 Street G, City', '3322110099', 7),
('OP808', 'Happy Mart', '505 Street H, City', '2211009988', 8),
('QR909', 'Discount Store', '606 Street I, City', '1100998877', 9),
('ST111', 'Easy Shop', '707 Street J, City', '0099887766', 10),
('UV222', 'Local Market', '808 Street K, City', '1199776655', 11),
('WX333', 'Budget Mart', '909 Street L, City', '2299665544', 12);

-- Insert into Customer
INSERT INTO customer (customer_id, name, contact, email) VALUES
('RS9876543210', 'Ramesh Sharma', '9876543210', 'ramesh.sharma@email.com'),
('AV8765432109', 'Ananya Verma', '8765432109', 'ananya.verma@email.com'),
('VP7654321098', 'Vikas Patel', '7654321098', 'vikas.patel@email.com'),
('NA6543210987', 'Neha Arora', '6543210987', 'neha.arora@email.com'),
('RM5432109876', 'Rohan Mehta', '5432109876', 'rohan.mehta@email.com'),
('SR4321098765', 'Sonal Roy', '4321098765', 'sonal.roy@email.com'),
('AS3210987654', 'Amit Singh', '3210987654', 'amit.singh@email.com'),
('PD2109876543', 'Priyanka Das', '2109876543', 'priyanka.das@email.com'),
('MN1098765432', 'Mohan Nair', '1098765432', 'mohan.nair@email.com'),
('KJ1987654321', 'Kiran Joshi', '1987654321', 'kiran.joshi@email.com'),
('RM2876543210', 'Raj Malhotra', '2876543210', 'raj.malhotra@email.com'),
('AR3765432109', 'Aarti Reddy', '3765432109', 'aarti.reddy@email.com');

-- Insert into Supplier
INSERT INTO supplier (supplier_id, name, contact, email, address) VALUES
('SYRA12345', 'Rajesh Suppliers', '9123456789', 'rajesh.suppliers@email.com', 'Street A, City'),
('SYAN23456', 'Anil Distributors', '9234567890', 'anil.distributors@email.com', 'Street B, City'),
('SYVI34567', 'Vikas Enterprises', '9345678901', 'vikas.enterprises@email.com', 'Street C, City'),
('SYMO45678', 'Mohan Traders', '9456789012', 'mohan.traders@email.com', 'Street D, City'),
('SYKA56789', 'Karan Suppliers', '9567890123', 'karan.suppliers@email.com', 'Street E, City'),
('SYAM67890', 'Amit Wholesalers', '9678901234', 'amit.wholesalers@email.com', 'Street F, City');

-- Insert into Product
INSERT INTO product (name, category, supplier_id, shop_id, price, stock_quantity) VALUES
('Rice', 'Grocery', 'SYRA12345', 'AB101', 50.00, 100),
('Wheat Flour', 'Grocery', 'SYAN23456', 'CD202', 40.00, 80),
('Sugar', 'Grocery', 'SYVI34567', 'EF303', 45.00, 50);

-- Insert into Order
INSERT INTO `order` (customer_id, shop_id, order_date, total_amount, status) VALUES
('RS9876543210', 'AB101', NOW(), 500.00, 'Completed'),
('AV8765432109', 'CD202', NOW(), 1000.00, 'Pending');

-- Insert into Order Details
INSERT INTO order_details (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 100.00),
(2, 2, 5, 200.00);

-- Insert into Employee
INSERT INTO employee (name, role, contact, shop_id, salary, salary_status) VALUES
('Suresh Kumar', 'Cashier', '7896541230', 'AB101', 15000.00, 'Pending'),
('Meena Gupta', 'Manager', '7896541231', 'CD202', 25000.00, 'Paid');

-- Insert into Payment
INSERT INTO payment (order_id, amount, method) VALUES
(1, 500.00, 'Cash'),
(2, 1000.00, 'UPI');

-- Insert into Attendance
INSERT INTO attendance (employee_id, attendance_date, check_in, check_out, status) VALUES
(1, '2025-02-25', '09:00:00', '18:00:00', 'Present'),
(2, '2025-02-25', '10:00:00', '19:00:00', 'Present');

-- Insert into Loyalty
INSERT INTO loyalty (customer_id, shop_id, purchase_amount, loyalty_points, purchase_date) VALUES
('RS9876543210', 'AB101', 500.00, 50, '2025-02-20'),
('AV8765432109', 'CD202', 1000.00, 100, '2025-02-21');
