# AceBook

[![Maintainability](https://api.codeclimate.com/v1/badges/a99a88d28ad37a79dbf6/maintainability)](https://codeclimate.com/github/codeclimate/codeclimate/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/a99a88d28ad37a79dbf6/test_coverage)](https://codeclimate.com/github/codeclimate/codeclimate/test_coverage) [![Build Status](https://travis-ci.com/ajbacon/acebook-true-GrIT.svg?branch=master)](https://travis-ci.com/ajbacon/acebook-true-GrIT)

[How to contribute to this project](#how-to-contribute-to-this-project) | [Quickstart](#quickstart) | [Versioning](#versioning) | [User stories](#user-stories) | [Database structure](#database-structure) | [Features](#features) | [Code style](#code-style) | [Tech used](#tech-used) | [Test coverage](#test-coverage) | [Contributors](#contributors)

Building and deploying a Facebook clone in Rails. Working as an Agile team and practising Scrum.

To visit the web app as a real world user, visit https://hidden-cliffs-27554.herokuapp.com/.

To find out more about our building process and first foray into Rails, please visit our blog: https://medium.com/true-grit.

To view our card wall visit https://trello.com/b/UbWgvieQ/acebook-true-grit

# How to contribute to this project
See [CONTRIBUTING.md](CONTRIBUTING.md)

# Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Versioning

Acebook uses ruby version 2.5.0. To change ruby versions run ```rvm install ruby-2.5.0``` in terminal.

## User stories

```
As a user   
So that I can let friends know what I'm doing   
I want to post a message to Acebook.
```
```
As a user   
So that I can see what others are saying   
I want to see their messages in reverse chronological order.     
```
```
As a user   
So that I can better appreciate the context of a post   
I want to see the time at which it was made.    
```
```
As a user   
So that I can post messages on Acebook as me   
I want to sign up to Acebook.   
```
```
As a user   
So that I can post messages on Acebook as me   
I want to log in to Acebook.   
```
```
As a user   
So that I can avoid others posting messages on Acebook as me   
I want to log out of Acebook.   
```
```
As a user  
So that I can edit a post I made a mistake on   
I want to edit a post I have made.   
```
```
As a user  
So that I can delete a post I regret  
I want to delete a post I have made.  
```
```
As a user  
So that I can share my opinion on a post I've read  
I want to leave a comment on a post.  
```
```
As a user  
So that I can edit a comment I made a mistake on   
I want to edit a comment I have made.   
```
```
As a user  
So that I can delete a comment I regret  
I want to delete a comment I have made.  
```
```
As a user   
So that I can see what others have commented  
I want to see their comments in reverse chronological order on a post.     
```
```
As a user   
So that I can better appreciate the context of a comment   
I want to see the time at which it was made.    
```
```
As a user  
So that I can read and write posts on my friend's wall   
I want to visit my friend's wall.   
```
```
As a user  
So that I can connect with other people on Acebook  
I want to add another user as a friend.      
```
```
As a user  
So that I can disconnect with people I no longer like on Acebook  
I want to remove existing friends.       
```
```
As a user  
So that I can control who I connect with on Acebook  
I want to refuse or accept a friend request that I have received       
```

## Database structure

**Table: users**

| id | email | username | encrypted_password | reset_password_token | reset_password_sent_at | remember_created_at | created_at | updated_at |
| ----- | --------- | ----------- | ----- | -------- | ---------- | ----------- | ------ | ------ |

**Table: posts**   

| id | message | created_at | updated_at | user_id | recipient_id |
| -- | ------- | ---------- | ------- | ----- | ---- |

**Table: posts**   

| id | message | created_at | updated_at | post_id | user_id
| -- | ------- | ---------- | ------- | ----- | ---- |

**Table: friend_requests**   

| id | user_id | pending_friend_id | created_at | updated_at |
| -- | ------- | ---------- | ------- | ----- |

**Table: friendships**   

| id | user_id | friend_id | created_at | updated_at |
| -- | ------- | ---------- | ------- | ----- |


## Features
- Sign up
- Sign in
- Sign up via GitHub
- Sign out
- View your wall
- Visit communal wall
- Visit other users' walls
- Add, delete, edit (cannot edit after 10 minutes) posts
- Add, delete, edit (cannot edit after 10 minutes) comments on posts
- View list of friends and potential friends
- Send friend request
- Remove existing friends
- Accept or decline friend requests

## Code style
- OOD
- TDD
- BDD

## Tech used

- Rails
- Rspec  
- Devise
- Travis CI
- FactoryBot
- ActiveRecord
- PostgreSQL
- Capybara
- GitHub
- HTML
- CSS
- Rubocop
- SimpleCov
- Heroku

## Test coverage  
#### Feature tests
    
User Sign Up
- when visiting the root directory, it redirects to sign up page if no user is signed in
- displays a confirmation message when a user signs up, password 6 characters
- displays a confirmation message when a user signs up, password 10 characters
- displays an error message if the password is too short (<6 characters)
- displays an error message if the password is too long (>10 characters)
- cannot sign up 2 accounts with the same username
- cannot sign up 2 accounts with the same username in all caps
- cannot sign up 2 accounts with the same email address
- displays an error message if the password confirmation doesn't match password
- displays an error message if the username is invalid (@)
- displays an error message if the email is invalid (email)
- displays an error message if the email is invalid (email@)
- displays an error message if the email is invalid (email.com)

GitHub Sign In
- user can sign in via GitHub

User Sign In
- displays an error message when the password is incorrect
- when signing in with email
  - displays a confirmation message when a user signs
  - can sign in when email is in all caps
  - displays an error message when the email address is incorrect
  - displays an error message when the email address is incorrect
- when signing in with username
  - displays a confirmation message when a user signs in
  - can sign in when username is in all caps
  - displays an error message when the username is incorrect
  
User Log Out
- logged in user can log out

Timeline
- On user wall
  - can submit posts and view them
  - posts are ordered reverse chronologically
  - posts render line breaks correctly
- On communal posts wall
  - can submit posts to the posts wall and view them
  - posts submitted to a user's wall do not show on the posts wall

User walls
- user can see their own wall after sign up
- user can see their own wall after sign in
- user is redirected to sign up page if trying to view a user page without logging in
- can submit posts on their own user page and view them
- can submit posts on another user's page and view them
- when searching with /id url
  - user can see another person's wall
  - user is redirected to 404 error page if trying to visit user page that does not exist
- when searching with /username url
  - user can see another person's wall
  - user is redirected to 404 error page if trying to visit user page that does not exist

Delete post
- can delete a post if it belongs to the user
- cannot delete a post if it does not belong to the user

Edit post
- can edit a post if it belongs to the user
- cannot edit post if it does not belong to the user
- cannot edit post via /posts/:id/edit, if it does not belong to the user
- it should block edit if expired time over 10mins

Comments
- user can leave a comment on a post
- comments are ordered reverse chronologically
  
Delete comment
- can delete a comment if it belongs to the user
- cannot delete a comment if it does not belong to the user

Edit comment
- can edit a comment if it belongs to the user
- cannot edit comment if it does not belong to the user
- cannot edit comment via /comments/:id/edit, if it does not belong to the user
- it should block edit if expired time over 10mins

Friend Requests
- user can send a friend request that is then accepted
- user can send a friend request that is then declined
- user can remove existing friend request

#### Controller tests

CommentsController  
- GET /comments/new
  - responds with 200
- POST /comments
  - responds with 200
  - creates a comment

PostsController
- GET /posts/new
  - responds with 200
- POST /posts
  - responds with 200
  - creates a post
- GET /posts
  - responds with 200

UsersController
- GET /users/:id
  - responds with 200

## Contributors

* [Andrew Bacon](https://github.com/ajbacon)
* [Jade Beresford](https://github.com/JKBero)
* [Raluca Ciucu](https://github.com/IngramCapa)
* [Charlie Paterson](https://github.com/CpaterCodes)
