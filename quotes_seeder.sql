USE quotes_db;

TRUNCATE quotes;

INSERT INTO quotes (author_first_name, author_last_name, quote)
VALUES  ('Douglas', 'Adams', 'Don''t panic'),
        ('Douglas', 'Adams', 'Time is an illusion. Lunchtime doubly so.'),
        ('Mark', 'Twain', 'Clothes make the man. Naked people have little or no influence on society.'),
        ('Kurt', 'Vonnegut', 'The universe is a big place, perhaps the biggest.'),
        (DEFAULT, 'Vonnegut', 'The universe is a big place, perhaps the biggest.');

INSERT INTO quotes(author_last_name, quote)
VALUES( 'ORSINGER', 'Take the loop out!');
