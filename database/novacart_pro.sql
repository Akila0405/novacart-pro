CREATE DATABASE IF NOT EXISTS novacart_pro CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE novacart_pro;

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS admins;

CREATE TABLE admins (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  email VARCHAR(160) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(160) NOT NULL,
  category VARCHAR(80) NOT NULL,
  price DECIMAL(12,2) NOT NULL,
  stock INT NOT NULL DEFAULT 0,
  image VARCHAR(255) NOT NULL,
  description TEXT,
  status ENUM('active','inactive') DEFAULT 'active',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NULL,
  customer_name VARCHAR(150) NOT NULL,
  email VARCHAR(160) NOT NULL,
  phone VARCHAR(40) NOT NULL,
  address TEXT NOT NULL,
  total DECIMAL(12,2) NOT NULL,
  status VARCHAR(40) DEFAULT 'Pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_orders_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

CREATE TABLE order_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NULL,
  product_name VARCHAR(160) NOT NULL,
  price DECIMAL(12,2) NOT NULL,
  qty INT NOT NULL,
  CONSTRAINT fk_items_order FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
  CONSTRAINT fk_items_product FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE SET NULL
);

CREATE TABLE messages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  email VARCHAR(160) NOT NULL,
  subject VARCHAR(180) NOT NULL,
  message TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO admins(username,password) VALUES
('admin','$2y$12$RpVVPS7P2FzJUjVhDkwXLO/MxX22i5/WYFGwltZyVDqQ3tnFNTHue');

INSERT INTO products(name,category,price,stock,image,description,status) VALUES
('AeroPods Max','Technology',18900,22,'assets/images/headphones.svg','Premium wireless headphones with immersive sound, comfortable cushions and long battery life.','active'),
('Nova Smart Watch','Technology',24900,17,'assets/images/watch.svg','Modern smartwatch for daily notifications, activity tracking and a clean digital lifestyle.','active'),
('City Runner Sneakers','Fashion',12900,31,'assets/images/shoe.svg','Lightweight everyday sneakers designed for comfort, movement and versatile styling.','active'),
('Minimal Street Bag','Fashion',9800,25,'assets/images/bag.svg','Structured carry bag with a clean silhouette and practical internal organization.','active'),
('Glow Ritual Set','Beauty',7600,40,'assets/images/beauty.svg','Simple self-care collection designed for a polished daily beauty routine.','active'),
('Cloud Home Lamp','Home',8900,18,'assets/images/home.svg','Ambient decorative lighting for modern bedrooms, desks and living spaces.','active'),
('Urban Essential Jacket','Fashion',16900,14,'assets/images/fashion.svg','Contemporary layering piece designed for clean city styling and everyday wear.','active'),
('Smart Desk Hub','Technology',14200,20,'assets/images/tech.svg','Compact desk accessory concept for a connected, organized workspace.','active'),
('Soft Home Accent','Home',6500,34,'assets/images/home.svg','Minimal home décor piece to add warmth and texture to contemporary interiors.','active'),
('Daily Beauty Duo','Beauty',5900,45,'assets/images/beauty.svg','A compact two-step beauty set for easy everyday use.','active'),
('Classic Everyday Watch','Fashion',11900,16,'assets/images/watch.svg','Clean watch design suitable for work, casual outfits and gifting.','active'),
('Studio Headphones','Technology',15900,27,'assets/images/headphones.svg','Comfortable over-ear headphones with a modern silhouette and rich listening experience.','active');
