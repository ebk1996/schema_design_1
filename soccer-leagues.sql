-- Drop and Create Soccer League Database
DROP DATABASE IF EXISTS soccer_league_db;
CREATE DATABASE soccer_league_db;
\c soccer_league_db
-- Soccer League Schema Design
CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    team_id INT NOT NULL REFERENCES teams(team_id),
    position VARCHAR(50)
);

CREATE TABLE referees (
    referee_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE seasons (
    season_id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    home_team_id INT NOT NULL REFERENCES teams(team_id),
    away_team_id INT NOT NULL REFERENCES teams(team_id),
    season_id INT NOT NULL REFERENCES seasons(season_id),
    match_date DATE NOT NULL
);

CREATE TABLE match_referees (
    match_id INT NOT NULL REFERENCES matches(match_id),
    referee_id INT NOT NULL REFERENCES referees(referee_id),
    PRIMARY KEY (match_id, referee_id)
);

CREATE TABLE goals (
    goal_id SERIAL PRIMARY KEY,
    match_id INT NOT NULL REFERENCES matches(match_id),
    player_id INT NOT NULL REFERENCES players(player_id),
    minute INT
);


-- Teams
INSERT INTO teams (name) VALUES ('Lions'), ('Tigers'), ('Bears'), ('Wolves');

-- Players (with positions)
INSERT INTO players (name, team_id, position) VALUES
    ('Alice', 1, 'Forward'),
    ('Bob', 1, 'Goalkeeper'),
    ('Charlie', 2, 'Midfielder'),
    ('Diana', 2, 'Defender'),
    ('Evan', 3, 'Forward'),
    ('Fay', 3, 'Midfielder'),
    ('Gina', 4, 'Defender'),
    ('Hank', 4, 'Goalkeeper');

-- Referees
INSERT INTO referees (name) VALUES ('Ref A'), ('Ref B'), ('Ref C');

-- Seasons
INSERT INTO seasons (start_date, end_date) VALUES ('2025-08-01', '2026-05-31'), ('2026-08-01', '2027-05-31');

-- Matches
INSERT INTO matches (home_team_id, away_team_id, season_id, match_date) VALUES
    (1, 2, 1, '2025-09-10'),
    (3, 4, 1, '2025-09-12'),
    (2, 3, 2, '2026-09-15'),
    (4, 1, 2, '2026-09-18');

-- Match Referees
INSERT INTO match_referees (match_id, referee_id) VALUES
    (1, 1), (1, 2),
    (2, 2), (2, 3),
    (3, 1), (3, 3),
    (4, 2);

-- Goals
INSERT INTO goals (match_id, player_id, minute) VALUES
    (1, 1, 15), (1, 3, 42),
    (2, 5, 10), (2, 8, 55),
    (3, 2, 23), (3, 6, 60),
    (4, 4, 33), (4, 7, 77);

-- Example Queries
-- 1. List all players and their teams
SELECT p.name AS player, t.name AS team FROM players p JOIN teams t ON p.team_id = t.team_id;

-- 2. List all goals scored in a match
SELECT g.goal_id, p.name AS player, g.minute FROM goals g JOIN players p ON g.player_id = p.player_id WHERE g.match_id = 1;

-- 3. List all matches with teams and referees
SELECT m.match_id, ht.name AS home_team, at.name AS away_team, m.match_date, r.name AS referee
FROM matches m
JOIN teams ht ON m.home_team_id = ht.team_id
JOIN teams at ON m.away_team_id = at.team_id
JOIN match_referees mr ON m.match_id = mr.match_id
JOIN referees r ON mr.referee_id = r.referee_id;

-- 4. Show standings (number of goals per team)
SELECT t.name AS team, COUNT(g.goal_id) AS goals_scored
FROM teams t
LEFT JOIN players p ON t.team_id = p.team_id
LEFT JOIN goals g ON p.player_id = g.player_id
GROUP BY t.name;
-- Soccer Leagues ER Diagram SQL DDL
-- Teams in the league
CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Players and their teams
CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    team_id INT NOT NULL REFERENCES teams(team_id)
);

-- Referees
CREATE TABLE referees (
    referee_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Seasons
CREATE TABLE seasons (
    season_id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- Matches between teams
CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    home_team_id INT NOT NULL REFERENCES teams(team_id),
    away_team_id INT NOT NULL REFERENCES teams(team_id),
    season_id INT NOT NULL REFERENCES seasons(season_id),
    match_date DATE NOT NULL
);

-- Referees assigned to matches (many-to-many)
CREATE TABLE match_referees (
    match_id INT NOT NULL REFERENCES matches(match_id),
    referee_id INT NOT NULL REFERENCES referees(referee_id),
    PRIMARY KEY (match_id, referee_id)
);

-- Goals scored by players in matches
CREATE TABLE goals (
    goal_id SERIAL PRIMARY KEY,
    match_id INT NOT NULL REFERENCES matches(match_id),
    player_id INT NOT NULL REFERENCES players(player_id),
    minute INT
);

-- Standings/rankings can be calculated from match results and goals