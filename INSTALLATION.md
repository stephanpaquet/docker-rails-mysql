git clone git@github.com:stephanpaquet/docker-rails-mysql.git

cd docker-rails-mysql  

git checkout main

docker compose build

docker compose run --no-deps app rails new . --force --mysql

sudo chown -R $USER:$USER .

docker compose build

cp .env.dist .env

## Replace the contents of config/database.yml with the following:
```
default: &default
  adapter: mysql2
  encoding: utf8mb4
  collation: utf8mb4_0900_ai_ci
  timeout: 5000
  pool:     <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  database: <%= ENV["DATABASE_NAME"] %>
  username: <%= ENV["DATABASE_USERNAME"] %>
  password: <%= ENV["DATABASE_PASSWORD"] %>
  host:     <%= ENV["DATABASE_HOST"] %>
  port:     <%= ENV["DATABASE_PORT"] %>

development:
  <<: *default

staging:
  <<: *default

production:
  <<: *default

test:
  adapter: mysql2
  encoding: utf8mb4
  collation: utf8mb4_0900_ai_ci
  timeout: 5000
  pool:     <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  database: <%= ENV["TEST_DATABASE_NAME"] %>
  username: <%= ENV["TEST_DATABASE_USERNAME"] %>
  password: <%= ENV["TEST_DATABASE_PASSWORD"] %>
  host:     <%= ENV["TEST_DATABASE_HOST"] %>
  port:     <%= ENV["TEST_DATABASE_PORT"] %>

```

## dans le fichier Gemfile

remplacer 
```
# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"
```
par 
```
# A simple, fast Mysql library for Ruby, binding to libmysql
gem 'mysql2', '0.5.3' 
```

et jouter le dotenv-rails
```
# Loads environment variables from `.env`.
gem 'dotenv-rails', '2.7.6'
```



docker compose run app bundle install

docker compose build

docker compose run app rake db:create

docker compose up

## Application 
http://localhost:3000

## PhpMyAdmin
http://localhost:8080




```
docker compose exec app ruby --version
$ ruby 2.7.4p191 (2021-07-07 revision a21a3b7d23) [x86_64-linux]
```

```
docker compose exec app rails --version
$ Rails 7.0.3
```

## Lister les routes
```
docker compose exec app rails routes
```
