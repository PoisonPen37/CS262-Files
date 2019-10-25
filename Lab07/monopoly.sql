--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
-- Collin Lilienthal

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS Player_Property;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50),
    piece_location integer,
    cash integer
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer
	);

CREATE TABLE Property (
    ID integer PRIMARY KEY,
    property_name text
    );   

CREATE TABLE Player_Property (
    ID integer PRIMARY KEY,
    propertyID integer REFERENCES Property(ID),
    houses integer,
    hotels integer
    );

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;
GRANT SELECT ON Player_Property TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO PlayerGame VALUES (1, 1, 0.00);
INSERT INTO PlayerGame VALUES (1, 2, 0.00);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00);
INSERT INTO PlayerGame VALUES (2, 2, 0.00);
INSERT INTO PlayerGame VALUES (2, 3, 500.00);
INSERT INTO PlayerGame VALUES (3, 2, 0.00);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00);

INSERT INTO Property VALUES (1, 'The Basement');
INSERT INTO Property VALUES (2, 'Boardwalk');

INSERT INTO Player_Property VALUES (1, 1, 3, 0);

--8.1.a
SELECT *
FROM Game
ORDER BY time DESC;

--8.1.b
SELECT *
FROM Game
WHERE time > time - interval '7 days';

--8.1.c
SELECT *
FROM Player
WHERE name IS NOT NULL;

--8.1.d
SELECT playerID
FROM PlayerGame
WHERE score > 2000;

--8.1.e
SELECT *
FROM Player
WHERE emailAddress LIKE '%gmail%';

--8.2.a
SELECT score
FROM Player, PlayerGame
WHERE Player.ID = PlayerGame.playerID
  AND Player.name = 'The King'
ORDER BY score DESC;

--8.2.b
SELECT Player.name 
FROM Player, Game, PlayerGame 
WHERE Player.ID = PlayerGame.playerID 
	AND Game.ID = PlayerGame.gameID 
	AND Game.time = '2006-06-28 13:20:00' 
ORDER BY PLayerGame.score DESC LIMIT 1;


