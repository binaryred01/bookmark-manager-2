CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
ALTER TABLE bookmarks ADD COLUMN title VARCHAR(60); #we added varchar 20 as a title does need as many characters