-- Soccer Leagues ER Diagram SQL DDL
CREATE TABLE Leagues (
    league_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Teams (
    team_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    league_id INT,
    FOREIGN KEY (league_id) REFERENCES Leagues(league_id)
);

CREATE TABLE Players (
    player_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    team_id INT,
    position VARCHAR(50),
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Matches (
    match_id INT PRIMARY KEY,
    home_team_id INT,
    away_team_id INT,
    match_date DATE,
    home_score INT,
    away_score INT,
    FOREIGN KEY (home_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (away_team_id) REFERENCES Teams(team_id)
);
