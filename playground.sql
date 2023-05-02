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