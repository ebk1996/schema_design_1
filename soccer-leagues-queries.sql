-- List all teams in the TUSD league
SELECT name FROM Teams WHERE league_id = 1;

-- Show all matches in the current season
SELECT m.match_id, t1.name AS home_team, t2.name AS away_team, m.match_date, m.home_score, m.away_score
FROM Matches m
JOIN Teams t1 ON m.home_team_id = t1.team_id
JOIN Teams t2 ON m.away_team_id = t2.team_id
WHERE t1.league_id = 1 AND t2.league_id = 1;

-- Get standings (total points per team)
SELECT
	t.name,
	SUM(
		CASE
			WHEN m.home_team_id = t.team_id AND m.home_score > m.away_score THEN 3
			WHEN m.away_team_id = t.team_id AND m.away_score > m.home_score THEN 3
			WHEN (m.home_team_id = t.team_id OR m.away_team_id = t.team_id) AND m.home_score = m.away_score THEN 1
			ELSE 0
		END
	) AS points
FROM Teams t
LEFT JOIN Matches m ON t.team_id = m.home_team_id OR t.team_id = m.away_team_id
WHERE t.league_id = 1
GROUP BY t.name
ORDER BY points DESC;

-- List all players for a team
SELECT name, position FROM Players WHERE team_id = 1; -- Tucson High
