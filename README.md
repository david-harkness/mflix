# README

### Production Link
https://david-mflix.herokuapp.com/

### Routes

Search for Star Wars

```
/api/v1/movies/search.json?title=star%20wars&page=1
```

```
Single Movie
/api/v1/movies/140
```


* System dependencies

* Configuration
RAILS_ENV=test rake db:create
RAILS_ENV=test rake db:migrate


* Database creation

```
rake db:create
rake db:migrate

RAILS_ENV=test rake db:create
RAILS_ENV=test rake db:migrate
```

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Setup
```export MOVIEDB_KEY='mykey'```

## Setup on Heroku

####Since we're using mysql instead of PostgreSQL
```
heroku addons:create cleardb:ignite
heroku addons:destroy heroku-postgresql
heroku config | grep CLEARDB_DATABASE_URL
heroku config:set DATABASE_URL='mysql2://my-url'
heroku config:set MOVIEDB_KEY='mykey'
```


### TODO
* Pagination
* Extra Tests
  (currently using rspec)
