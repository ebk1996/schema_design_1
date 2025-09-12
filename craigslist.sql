-- Create Craigslist database and connect
CREATE DATABASE craigslist_db;
\c craigslist_db

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE posts (
    post_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Sample data insertion
INSERT INTO users (user_id, username, email) VALUES
    (1, 'alice', 'alice@example.com'),
    (2, 'bob', 'bob@example.com');

INSERT INTO categories (category_id, name) VALUES
    (1, 'For Sale'),
    (2, 'Jobs');

INSERT INTO posts (post_id, user_id, category_id, title, description) VALUES
    (1, 1, 1, 'Bike for sale', 'A lightly used mountain bike.'),
    (2, 2, 2, 'Software Engineer', 'Looking for a full-stack developer.');
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Listings (
    listing_id INT PRIMARY KEY,
    user_id INT,
    category_id INT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2),
    post_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Example Queries for Craigslist DB
-- 1. List all posts with user and category info
SELECT p.post_id, p.title, p.description, u.username, c.name AS category
FROM posts p
JOIN users u ON p.user_id = u.user_id
JOIN categories c ON p.category_id = c.category_id;

-- 2. Find posts by a specific user (e.g., 'alice')
SELECT p.post_id, p.title, p.description
FROM posts p
JOIN users u ON p.user_id = u.user_id
WHERE u.username = 'alice';

-- 3. Count posts per category
SELECT c.name AS category, COUNT(p.post_id) AS post_count
FROM categories c
LEFT JOIN posts p ON c.category_id = p.category_id
GROUP BY c.name;
