-- Insert sample data for TUSD School District Soccer League
INSERT INTO Leagues (league_id, name) VALUES (1, 'TUSD Soccer League');

INSERT INTO Teams (team_id, name, league_id) VALUES
	(1, 'Tucson High', 1),
	(2, 'Palo Verde', 1),
	(3, 'Cholla', 1),
	(4, 'Sahuaro', 1);

INSERT INTO Players (player_id, name, team_id, position) VALUES
	(1, 'Alex Smith', 1, 'Forward'),
	(2, 'Maria Garcia', 2, 'Midfielder'),
	(3, 'John Lee', 3, 'Defender'),
	(4, 'Emily Chen', 4, 'Goalkeeper');

INSERT INTO Matches (match_id, home_team_id, away_team_id, match_date, home_score, away_score) VALUES
	(1, 1, 2, '2025-09-15', 2, 1),
	(2, 3, 4, '2025-09-16', 0, 3),
	(3, 1, 3, '2025-09-22', 1, 1),
	(4, 2, 4, '2025-09-23', 2, 2);
