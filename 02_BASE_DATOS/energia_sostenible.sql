-- Create database
CREATE DATABASE IF NOT EXISTS energia_sostenible;
USE energia_sostenible;

-- Create tables
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS energy_sources (
    id INT AUTO_INCREMENT PRIMARY KEY,
    source_name VARCHAR(100) NOT NULL,
    renewable TINYINT(1) NOT NULL -- BOOLEAN alias
);

CREATE TABLE IF NOT EXISTS energy_consumption (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    source_id INT NOT NULL,
    amount FLOAT NOT NULL,
    consumption_date DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (source_id) REFERENCES energy_sources(id)
);

-- Insert sample data
INSERT INTO users (username, email) VALUES
('user1', 'user1@example.com'),
('user2', 'user2@example.com');

INSERT INTO energy_sources (source_name, renewable) VALUES
('Solar', 1),
('Wind', 1),
('Natural Gas', 0),
('Coal', 0);

INSERT INTO energy_consumption (user_id, source_id, amount, consumption_date) VALUES
(1, 1, 150.5, '2026-04-01 10:00:00'),
(1, 2, 85.0, '2026-04-02 10:00:00'),
(2, 3, 200.0, '2026-04-02 11:00:00');

-- Create indexes
CREATE INDEX idx_user_id ON energy_consumption(user_id);
CREATE INDEX idx_source_id ON energy_consumption(source_id);
