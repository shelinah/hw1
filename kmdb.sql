DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS studios;
DROP TABLE IF EXISTS agents;

CREATE TABLE agents (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
);

CREATE TABLE studios (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
);

CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  year_released INTEGER,
  rated TEXT,
  studio_id INTEGER
);

CREATE TABLE actors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  agent_id INTEGER
);

CREATE TABLE roles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  character_name TEXT,
  movie_id INTEGER,
  actor_id INTEGER
);


INSERT INTO agents (name) VALUES ("Joanna Smith");

INSERT INTO studios (name) VALUES ("Warner Bros.");

-- Movies (studio_id = 1 for Warner Bros.)
INSERT INTO movies (title, year_released, rated, studio_id)
VALUES ("Batman Begins", 2005, "PG-13", 1);

INSERT INTO movies (title, year_released, rated, studio_id)
VALUES ("The Dark Knight", 2008, "PG-13", 1);

INSERT INTO movies (title, year_released, rated, studio_id)
VALUES ("The Dark Knight Rises", 2012, "PG-13", 1);

INSERT INTO actors (name) VALUES ("Christian Bale");
INSERT INTO actors (name) VALUES ("Michael Caine");
INSERT INTO actors (name) VALUES ("Liam Neeson");
INSERT INTO actors (name) VALUES ("Katie Holmes");
INSERT INTO actors (name) VALUES ("Gary Oldman");
INSERT INTO actors (name) VALUES ("Heath Ledger");
INSERT INTO actors (name) VALUES ("Aaron Eckhart");
INSERT INTO actors (name) VALUES ("Maggie Gyllenhaal");
INSERT INTO actors (name) VALUES ("Tom Hardy");
INSERT INTO actors (name) VALUES ("Joseph Gordon-Levitt");
INSERT INTO actors (name) VALUES ("Anne Hathaway");

INSERT INTO roles (character_name, movie_id, actor_id) VALUES ("Bruce Wayne", 1, 1);
INSERT INTO roles (character_name, movie_id, actor_id) VALUES ("Alfred", 1, 2);
INSERT INTO roles (character_name, movie_id, actor_id) VALUES ("Ra's Al Ghul", 1, 3);
INSERT INTO roles (character_name, movie_id, actor_id) VALUES ("Rachel Dawes", 1, 4);
INSERT INTO roles (character_name, movie_id, actor_id) VALUES ("Commissioner Gordon", 1, 5);

INSERT INTO roles (character_name, movie_id, actor_id) VALUES ("Bruce Wayne", 2, 1);
INSERT INTO roles (character_name, movie_id, actor_id) VALUES ("Joker", 2, 6);
INSERT INTO roles (character_name, movie_id, actor_id) VALUES ("Harvey Dent", 2, 7);
INSERT INTO roles (character_name, movie_id, actor_id) VALUES ("Alfred", 2, 2);
INSERT INTO roles (character_name, movie_id, actor_id) VALUES ("Rachel Dawes", 2, 8);

INSERT INTO roles (character_name, movie_id, actor_id) VALUES ("Bruce Wayne", 3, 1);
INSERT INTO roles (character_name, movie_id, actor_id) VALUES ("Commissioner Gordon", 3, 5);
INSERT INTO roles (character_name, movie_id, actor_id) VALUES ("Bane", 3, 9);
INSERT INTO roles (character_name, movie_id, actor_id) VALUES ("John Blake", 3, 10);
INSERT INTO roles (character_name, movie_id, actor_id) VALUES ("Selina Kyle", 3, 11);

UPDATE actors SET agent_id = 1 WHERE id = 1;


.print "Movies"
.print "======"
.print ""

SELECT movies.title, movies.year_released, movies.rated, studios.name
FROM movies
JOIN studios ON movies.studio_id = studios.id;

.print ""
.print "Top Cast"
.print "========"
.print ""

SELECT movies.title, actors.name, roles.character_name
FROM roles
JOIN movies ON roles.movie_id = movies.id
JOIN actors ON roles.actor_id = actors.id
ORDER BY movies.id;

.print ""
.print "Represented by agent"
.print "===================="
.print ""

SELECT actors.name
FROM actors
JOIN agents ON actors.agent_id = agents.id
WHERE agents.name = "Joanna Smith";