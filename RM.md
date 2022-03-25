docker compose build

docker compose run --no-deps web rails new . --force --mysql

<!-- sudo chown -R $USER:$USER . -->

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

 docker compose up

 docker compose run web rake db:create
