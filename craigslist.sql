-- Create Craigslist database and connect
CREATE DATABASE craigslist_db;
\c craigslist_db

-- Regions for posts
CREATE TABLE regions (
    region_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Users and their preferred region
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    preferred_region_id INT REFERENCES regions(region_id)
);

-- Categories for posts
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Posts with user, location, region, and category
CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id),
    title VARCHAR(100) NOT NULL,
    text TEXT,
    location VARCHAR(100),
    region_id INT NOT NULL REFERENCES regions(region_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Posts can belong to multiple categories
CREATE TABLE post_categories (
    post_id INT NOT NULL REFERENCES posts(post_id),
    category_id INT NOT NULL REFERENCES categories(category_id),
    PRIMARY KEY (post_id, category_id)
);