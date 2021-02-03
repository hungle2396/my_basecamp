# README
## To see the heroku website
go to https://basecamp-17.herokuapp.com

## This steps are necessary to get the application up and running.

1. install yarn, npm, sqlite3, ruby, rails
2. ruby version 2.6.6
3. to run a server   
```rails server```  
*To stop the web server, hit Ctrl+C in the terminal window where it's running.
Things you may want to cover:
4. for db migration: ```rails db:migrate```   
## Deployment instruction
**it happens on main branch**  
$ heroku login  
$ heroku git:clone -a basecamp-17  
$ cd basecamp-17  
$ git add .  
$ git commit -am "make it better"  
$ git push heroku main:master  
$ heroku run rails db:migrate

## Current website's features
- you can sign in, log in and sign out
- you can edit profile or destroy it (within users/edit page)
- you can create projects within your profile
- to see all users, go to /users, there you can make website admins or remove admins.  

test
