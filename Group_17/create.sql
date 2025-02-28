-- Member (Shop Owner) Table
CREATE TABLE member (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    image VARCHAR(255),
    age INT NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    contact_number VARCHAR(15) UNIQUE NOT NULL
);

-- Shop Table
CREATE TABLE shop (
    shop_id VARCHAR(5) PRIMARY KEY,  -- Format: AB123
    name VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    contact VARCHAR(15) UNIQUE NOT NULL,
    member_id INT NOT NULL,  -- Shop owner reference
    FOREIGN KEY (member_id) REFERENCES member(member_id) ON DELETE CASCADE
);

-- Customer Table
CREATE TABLE customer (
    customer_id VARCHAR(12) PRIMARY KEY,  -- Format: RS9876543215
    name VARCHAR(255) NOT NULL,
    contact VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Supplier Table
CREATE TABLE supplier (
    supplier_id VARCHAR(9) PRIMARY KEY,  -- Format: SYAB12345
    name VARCHAR(255) NOT NULL,
    contact VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    address TEXT NOT NULL
);

-- Product Table
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL,
    supplier_id VARCHAR(9),  -- Matches supplier.supplier_id
    shop_id VARCHAR(5),      -- Matches shop.shop_id
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    stock_status ENUM('Normal', 'Low Stock') GENERATED ALWAYS AS (
        CASE 
            WHEN stock_quantity < 5 THEN 'Low Stock'
            ELSE 'Normal'
        END
    ) STORED,
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id) ON DELETE SET NULL,
    FOREIGN KEY (shop_id) REFERENCES shop(shop_id) ON DELETE SET NULL
);

-- Order Table
CREATE TABLE `order` (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id VARCHAR(12),  -- Matches customer.customer_id
    shop_id VARCHAR(5),       -- Matches shop.shop_id
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    status ENUM('Pending', 'Completed', 'Cancelled') NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE SET NULL,
    FOREIGN KEY (shop_id) REFERENCES shop(shop_id) ON DELETE SET NULL
);

-- Order Details Table
CREATE TABLE order_details (
    order_details_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `order`(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE
);

-- Employee Table
CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,
    contact VARCHAR(15) UNIQUE NOT NULL,
    shop_id VARCHAR(5),  -- Matches shop.shop_id
    salary DECIMAL(10,2) NOT NULL,
    salary_status ENUM('Paid', 'Pending') DEFAULT 'Pending' NOT NULL,
    FOREIGN KEY (shop_id) REFERENCES shop(shop_id) ON DELETE SET NULL
);

-- Payment Table
CREATE TABLE payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    method ENUM('Cash', 'Credit', 'Debit', 'UPI', 'Digital Wallet') NOT NULL,
    transaction_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `order`(order_id) ON DELETE CASCADE
);

-- Attendance Table
CREATE TABLE attendance (
    employee_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    check_in TIME NOT NULL,
    check_out TIME,
    status ENUM('Present', 'Absent', 'On Leave') NOT NULL,
    PRIMARY KEY (employee_id, attendance_date),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE
);

-- Loyalty Table
CREATE TABLE loyalty (
    loyalty_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id VARCHAR(12),  -- Matches customer.customer_id
    shop_id VARCHAR(5),       -- Matches shop.shop_id
    purchase_amount DECIMAL(10,2) NOT NULL,
    loyalty_points INT NOT NULL,
    purchase_date DATE NOT NULL,
    points_valid_till DATE GENERATED ALWAYS AS (
        DATE_ADD(purchase_date, INTERVAL 3 MONTH)
    ) STORED,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (shop_id) REFERENCES shop(shop_id) ON DELETE CASCADE
);
