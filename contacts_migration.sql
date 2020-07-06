USE codeup_test_db;

DROP TABLE IF EXISTS contacts;

-- id
-- name
-- number
-- email
-- created_at
-- updated_at

CREATE TABLE contacts (
      id INT UNSIGNED NOT NULL AUTO_INCREMENT,
      name VARCHAR(100) NOT NULL,
      phone_number VARCHAR(30),
      email VARCHAR(50),
      created_at DATETIME,
      updated_at DATETIME,
      PRIMARY KEY (id)
);


