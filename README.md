# README

## Ruby on Rails Guides (v7.0.3)
https://guides.rubyonrails.org/


## Migration 
https://guides.rubyonrails.org/active_record_migrations.html

## Generator
```
rails generate 

rails generate controller home index 

rails generate scaffold friends first_name:string last_name:string email:string phone:string twitter:string

rails db:migrate

```

## Devise
```

rails generate devise:install

rails generate devise user

rails db:migrate

gem 'devise', '~> 4.8', '>= 4.8.1'
```
## Association
https://guides.rubyonrails.org/association_basics.html

```
rails g migration add_user_id_to_friends user_id:integer:index


```

https://youtu.be/fmyvWz5TUWg

Bonne intro sur Ruby on Rails, 
* route / controller / model
* generate
* scaffold
* Account


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
