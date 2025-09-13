-- Example queries for Craigslist schema
-- 1. List all posts with user, region, and category info
SELECT p.post_id, p.title, p.text, u.username, r.name AS region, c.name AS category
FROM posts p
JOIN users u ON p.user_id = u.user_id
JOIN regions r ON p.region_id = r.region_id
JOIN post_categories pc ON p.post_id = pc.post_id
JOIN categories c ON pc.category_id = c.category_id;

-- 2. Find posts by a specific user (e.g., 'alice')
SELECT p.post_id, p.title, p.text
FROM posts p
JOIN users u ON p.user_id = u.user_id
WHERE u.username = 'alice';

-- 3. Count posts per region
SELECT r.name AS region, COUNT(p.post_id) AS post_count
FROM regions r
LEFT JOIN posts p ON r.region_id = p.region_id
GROUP BY r.name;

-- 4. List users and their preferred region
SELECT u.username, r.name AS preferred_region
FROM users u
JOIN regions r ON u.preferred_region_id = r.region_id;

-- 5. List all categories for a given post (e.g., post_id = 1)
SELECT c.name AS category
FROM post_categories pc
JOIN categories c ON pc.category_id = c.category_id
WHERE pc.post_id = 1;
