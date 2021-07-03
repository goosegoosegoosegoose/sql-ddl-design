

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    rank INTEGER NOT NULL
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER NOT NULL REFERENCES teams
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    yrs_of_exp INTEGER
);

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    start DATE NOT NULL,
    finish DATE NOT NULL
);

CREATE TABLE games
(
    id SERIAL PRIMARY KEY,
    team1_id INTEGER REFERENCES teams,
    team2_id INTEGER REFERENCES teams,
    ref_id INTEGER REFERENCES referees,
    season_id INTEGER REFERENCES seasons
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER NOT NULL REFERENCES players,
    game_id INTEGER NOT NULL REFERENCES games
);