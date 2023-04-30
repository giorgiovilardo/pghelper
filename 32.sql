DROP TABLE IF EXISTS "user", photos;

CREATE TABLE "user" (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    username VARCHAR(50)
);

INSERT INTO "user" (username)
VALUES ('admin'), ('cambiasso'), ('zanetti'), ('giorgio'), ('pupo');

CREATE TABLE "photos" (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    url VARCHAR(200),
    user_id INTEGER REFERENCES "user"(id) ON DELETE SET NULL
);

INSERT INTO "photos"
    (url, user_id)
VALUES
    ('http://a.example', 4),
    ('http://41.example', 4),
    ('http://412.example', 4),
    ('http://b.example', 1),
    ('http://7.example', 1),
    ('http://123.example', 1),
    ('http://de.example', 1),
    ('http://toti.example', 1),
    ('http://c.example', 2),
    ('http://czx.example', 2),
    ('http://d.example', 3)
;

DELETE FROM "user" WHERE "user".id = 1;