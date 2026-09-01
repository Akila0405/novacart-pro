# NovaCart Pro — Advanced Online Business Web System

A database-driven online business project created for the Web Application Development assignment.

## Main Customer Pages
1. Home
2. Shop
3. Collections
4. Product Details
5. About
6. Contact
7. Cart
8. Checkout
9. Register / Login
10. My Account / Order History
11. Wishlist

## Advanced Features
- Responsive graphical UI with glassmorphism, gradients, cards and category visuals
- Dynamic product catalogue loaded from MySQL
- Product search and category filtering
- Product details pages
- JavaScript cart interactions
- Session-based shopping cart
- Customer registration and login using password hashing
- Checkout and order creation
- Customer order history
- Browser-based wishlist
- Contact form stored in database
- Admin login and secure admin session
- Admin dashboard metrics
- Product CRUD: Create, Read, Update and Delete
- Order management and status updates
- Customer management/reporting
- Message management
- Responsive mobile layout

## Technology
- HTML5
- CSS3
- JavaScript
- PHP 8+
- MySQL / MariaDB
- PDO prepared statements

## Setup with XAMPP
1. Copy the `novacart_pro` folder into `C:/xampp/htdocs/`.
2. Start Apache and MySQL in XAMPP.
3. Open phpMyAdmin: `http://localhost/phpmyadmin`.
4. Import `database/novacart_pro.sql`.
5. Open `http://localhost/novacart_pro/`.
6. Admin panel: `http://localhost/novacart_pro/admin/login.php`.

## Admin Login
- Username: `admin`
- Password: `Admin@123`

## Database
Database name: `novacart_pro`

Tables:
- admins
- users
- products
- orders
- order_items
- messages

The database supports the required DML operations through the website and admin panel.
