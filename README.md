Not complete 
# Chitter - twitter clone

![Alt text](public/homepage.png?raw=true "Home page")
![Alt text](public/mainpage.png?raw=true "Home page")

#User stories

```
As a time-pressed user
So that i can quickly go to a web site I regularly visit
I would like to see a list of Chits
```
```
As a user
So I can store my tweets as data for later retrieval
I want to add tweets to my Chitter
```
```
As a user
So I can remove my tweets from chitter
I want to delete a tweet
```
```
As a user
So I can change a tweet in Chitter
I want to edit my tweet
```
```
As a user
So I can add to a tweet
I want to comment on a tweet
```

```
As a user
So that I can categorize my tweets
I want to add a Tag to a tweet
```
```
As a user
So that I can find relevant tweets
I want to filter though tweets by a Tag
```


## How to use
##(1) Clone this repository and run

```
bundle
```
###(2) Connect to psql and create databases
```
CREATE DATABASE chitter;
CREATE DATABASE chitter_test;
```
###(3) Table setup 
Connect to both databases and copy the SQL scripts in given order from `db/migrations`
### To run the Bookmark Manager app:
```
rackup
```
