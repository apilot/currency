# README

Project for get currency course (USD/RUB) online, and auto refresh on page in opened window without reload page
In Admin section you may freeze course with timer

For test project need to start separatly, after bundle and rails db:setup

1. rake resque:scheduler
2. QUEUE=* rake resque:work
3. hivemind Procfile.dev

Resque web interface accesed by this address
http://localhost:5000/resque/schedule

* Ruby version
3.0.3
* Database creation
rails db:create
* Database initialization
rails db:migrate
* How to run the test suite

Issue:
1. dinamically created jobs not worked 
