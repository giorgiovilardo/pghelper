SELECT *
FROM users
ORDER BY id DESC
LIMIT 3;

SELECT u.username, p.caption
FROM users u
JOIN posts p ON u.id = p.user_id
WHERE u.id = 200;

SELECT username, COUNT(*) as likes
FROM users u
JOIN likes l ON u.id = l.user_id
GROUP BY username
ORDER BY likes DESC;

SHOW DATA_DIRECTORY;

SELECT *
FROM pg_database;

EXPLAIN ANALYSE WITH RECURSIVE suggestions(leader_id, follower_id, depth) as (
  SELECT leader_id, follower_id, 1 as depth
  FROM followers
  WHERE follower_id = 1000
  UNION
  SELECT followers.leader_id, followers.follower_id, depth + 1
  FROM followers
  JOIN suggestions on suggestions.leader_id = followers.follower_id
  WHERE depth < 3
)
SELECT DISTINCT users.id, users.username
FROM suggestions
JOIN users ON users.id = suggestions.leader_id
WHERE depth > 1
LIMIT 30;

