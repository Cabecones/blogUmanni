# Project Umanni by Keven

## Requirements
 *| Version
 --- | ---
 `Ruby` | *2.7.6*
 `Rails` | *6.1.5*
 
## How to run the project

Run this command to install the necessary ruby gems
```
bundle install
```

Go to `/config/database.yml` and fill in the username and password of your postgresql user to run the local database

Start the database with the following commands:
```
rails db:create
rails db:migrate
rails db:seed
```
Now you can start the server
```
rails s
```
