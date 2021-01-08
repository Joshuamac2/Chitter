CREATE TABLE tweet_tags(tag_id INTEGER REFERENCES tags (id), tweet_id INTEGER REFERENCES tweets (id));
