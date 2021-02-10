Not complete
# Chitter - twitter clone

A twitter clone where users can sign up to post, edit, delete, tag and comment on tweets with timestamps that are unique to the user.

![Alt text](public/homepage.png?raw=true "Home page")
![Alt text](public/mainpage.png?raw=true "Home page")

#### Set up
- 1. Clone this repository and run

```
bundle
```

- 2. Set up the databases and run

```
psql postgres
```
```
CREATE DATABASE chitter;
```

- 3. Connect to  database and copy the SQL scripts in given order from db/migrations

- 4. In terminal run
```
rackup
```
- 5. Visit localhost:9292 in browser

#### User stories

```
STRAIGHT UP

As a user
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a user
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a user
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a user
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a user
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a user
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a user
So that I can find relevant tweets
I want to filter though tweets by a Tag

As a user
In order to start a conversation as a maker I want to reply to a peep from another maker.
```

#### Spec

- Ruby
- RSpec
- Capybara
- Sinatra / flash
- PG
- HTML / CSS
