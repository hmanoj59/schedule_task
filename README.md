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

*before you run the app. make sure you run this script on your database

CREATE database skejuler_dev;

CREATE USER pguser  WITH password 'password';

GRANT ALL ON database skejuler_dev TO pguser;