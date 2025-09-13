-- Seed data for Craigslist schema
INSERT INTO regions (name) VALUES ('San Francisco'), ('Atlanta'), ('Seattle'), ('New York');

INSERT INTO users (username, email, preferred_region_id) VALUES
    ('alice', 'alice@example.com', 1),
    ('bob', 'bob@example.com', 2),
    ('carol', 'carol@example.com', 3),
    ('dave', 'dave@example.com', 4);

INSERT INTO categories (name) VALUES ('For Sale'), ('Jobs'), ('Housing'), ('Services');

INSERT INTO posts (user_id, title, text, location, region_id) VALUES
    (1, 'Bike for sale', 'A lightly used mountain bike.', 'Mission District', 1),
    (2, 'Software Engineer', 'Looking for a full-stack developer.', 'Midtown', 2),
    (3, 'Apartment for rent', '2BR apartment available.', 'Capitol Hill', 3),
    (4, 'Plumbing Service', 'Experienced plumber available.', 'Brooklyn', 4);

INSERT INTO post_categories (post_id, category_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);
