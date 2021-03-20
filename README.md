# README

## What is Basecamp?
A useful application that will make sure to keep you and your team up to date and increase productivity by giving you the option to create tasks for your team.

## To see the Website

go to [basecamp](https://basecamp-17.herokuapp.com)

## Steps to get the application up and running in your editor

1. install yarn, npm, sqlite3, ruby, rails
2. ruby version 2.6.6
3. to run a server  
   `rails server`  
   \*To stop the web server, hit Ctrl+C in the terminal window where it's running.
   Things you may want to cover:
4. for db migration: `rails db:migrate`

## Deployment instruction

**it happens on main branch**  
$ heroku login  
$ git add .  
$ git commit -am "make it better"  
$ git push heroku main  
$ heroku run rails db:migrate

## Contribution
- This is an application that I collaborated with another developer (alekseevaiana) while studying at Qwasar Silicon Valley.

Features that I implemented:
- User authentication - Making sure that users can only access their own accounts, unless the user is admin.
- Project Feature - User can create, edit, and delete projects
- User invitation Feature - User can invite other users with their emails.
- Tasks Feature - User can create, edit, and delete tasks of a specific project.
- Public Chatroom Feature - User can chat to everyone in the website.
- UI Design - do the layout, colors, etc..

## Current website's features

- you can sign in, log in and sign out
- you can edit profile or destroy it (within users/edit page)
- you can create projects within your profile
- you can create projects
- inside projects you can create discutions, attachments, and todo list
- you can use a chatroom inside a project
