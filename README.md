- rails g scaffold events event_type:string public:boolean repo_id:integer actor_id:integer --no-test-framework
- add event_type validation in Event model
- rails g scaffold_controller repos --no-test-framework
- rails g scaffold_controller users --no-test-framework

# README

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
