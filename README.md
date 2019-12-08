# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration
Copy master.key to production env

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
cap install
cap production deploy

in server: current diretory
puma -b unix:/home/ubuntu/aje/shared/tmp/sockets/puma.sock -e production -d
* ...
