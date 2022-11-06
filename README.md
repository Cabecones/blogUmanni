# Project Umanni by Keven

Requirements
 *| Version
 --- | ---
 `Ruby` | *2.7.6*
 `Rails` | *6.1.5*
 

Run the command to install the necessary dependencies
```
bundle install
```

Go to the /config/database.yml file and fill in the username and password of your postgresql user to run the local database

Start the database with the command:
```
rails db:create
```
```
rails db:seed
```
```
rails db:migrate
```
Now you can start the server
```
rails s
```
