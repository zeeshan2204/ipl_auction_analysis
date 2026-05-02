
-- =============================================
-- IPL AUCTION ANALYSIS - MySQL Schema
-- =============================================

CREATE DATABASE IF NOT EXISTS ipl_auction_analysis;
USE ipl_auction_analysis;

-- 1. SEASONS TABLE
CREATE TABLE seasons (
    season VARCHAR(20) PRIMARY KEY,
    total_matches INT,
    num_teams INT,
    champion VARCHAR(100),
    runner_up VARCHAR(100),
    orange_cap_winner VARCHAR(100),
    purple_cap_winner VARCHAR(100),
    most_valuable_player VARCHAR(100),
    total_runs INT,
    total_wickets INT,
    highest_score INT,
    best_bowling VARCHAR(20),
    total_fours INT,
    total_sixes INT
);

-- 2. MATCHES TABLE
CREATE TABLE matches (
    match_id VARCHAR(20) PRIMARY KEY,
    season VARCHAR(20),
    match_number INT,
    stage VARCHAR(50),
    date DATE,
    venue VARCHAR(100),
    city VARCHAR(100),
    team1 VARCHAR(100),
    team2 VARCHAR(100),
    toss_winner VARCHAR(100),
    toss_decision VARCHAR(10),
    first_innings_score INT,
    second_innings_score INT,
    winner VARCHAR(100),
    win_margin INT,
    win_type VARCHAR(20),
    player_of_match VARCHAR(100),
    umpire1 VARCHAR(100),
    umpire2 VARCHAR(100),
    FOREIGN KEY (season) REFERENCES seasons(season)
);

-- 3. PLAYERS TABLE
CREATE TABLE players (
    player_id VARCHAR(20) PRIMARY KEY,
    player_name VARCHAR(100),
    nationality VARCHAR(50),
    dob_year INT,
    batting_style VARCHAR(50),
    bowling_style VARCHAR(100),
    playing_role VARCHAR(50),
    ipl_debut_season VARCHAR(20),
    last_season VARCHAR(20),
    total_matches INT,
    total_runs INT,
    total_wickets INT
);

-- 4. DELIVERIES TABLE
CREATE TABLE deliveries (
    delivery_id VARCHAR(30) PRIMARY KEY,
    match_id VARCHAR(20),
    innings INT,
    over_num INT,
    ball INT,
    batting_team VARCHAR(100),
    bowling_team VARCHAR(100),
    striker VARCHAR(100),
    non_striker VARCHAR(100),
    bowler VARCHAR(100),
    batsman_runs INT,
    extra_runs INT,
    total_runs INT,
    extra_type VARCHAR(20),
    is_wicket BOOLEAN,
    dismissal_type VARCHAR(50),
    dismissed_player VARCHAR(100),
    fielder VARCHAR(100),
    FOREIGN KEY (match_id) REFERENCES matches(match_id)
);

-- 5. AUCTION TABLE
CREATE TABLE auction (
    auction_id INT AUTO_INCREMENT PRIMARY KEY,
    team VARCHAR(100),
    player VARCHAR(100),
    type VARCHAR(50),
    price_crore DECIMAL(10,2),
    year INT
);

-- 6. TOP BATSMEN TABLE
CREATE TABLE top_batsmen (
    pos INT PRIMARY KEY,
    player VARCHAR(100),
    matches INT,
    innings INT,
    not_out INT,
    runs INT,
    highest_score VARCHAR(10),
    avg DECIMAL(10,2),
    balls_faced INT,
    strike_rate DECIMAL(10,2),
    hundreds INT,
    fifties INT,
    fours INT,
    sixes INT
);

-- 7. TOP BOWLERS TABLE
CREATE TABLE top_bowlers (
    pos INT PRIMARY KEY,
    player VARCHAR(100),
    matches INT,
    innings INT,
    overs DECIMAL(10,1),
    runs INT,
    wickets INT,
    bbi VARCHAR(10),
    avg DECIMAL(10,2),
    economy DECIMAL(10,2),
    strike_rate DECIMAL(10,2),
    four_wickets INT,
    five_wickets INT
);
