The task is to create a simple web application that works as an Instant messaging application.

But there is a twist - all the instant messages should be translated via an API to one of three possible dialects (Yoda, Valley Girl and Binary Code) to make the instant messaging conversation more colorful :)

The source urls for the API dialects:

* Yoda ­ http://www.degraeve.com/translator.php
* Valley Girl ­ http://www.degraeve.com/translator.php
* You can use alternative sources for these dialects if you wish.

## User stories

* As a guest when arriving at the main page I can fill out a form with my username and selection of dialect
* Store user in session
* As a user when I submit an instant message the text gets converted to my previously selected dialect and displayed on the chat page and all the users that are currently viewing the chat immediately see the message.
* Message display the submission time, author and message itself.
* Add descriptive dialect icons to each of the messages depending on which dialect is being used. (ex. pirate dialect a pirate flag)
* The dialect API classes have to be created in ruby
* You can use the subscribe/publish technology of your choice, faye, websocket­rails etc.

## Extra feature
* Dialect can be change in between messages, from the dialect dropdown
* Displaying currently active user list

## Tools
* Rails 5
* Ruby 2.3.x
* Redis
* ActiveModel (No model persistance required)
* ActionCable
* ActiveJob (for sending messages asynchronously)
* Ruby's native Net::HTTP
* Rspec for Unit Testing
* Bootstrap for themeing

## Run locally

    $ bundle install
    $ bundle exec rails s

## Run tests

    $ bundle exec rspec

## Choices/Tradeoffs

* Kept the application as simple as possible.
* Made use of ActiveModel (personal choice), no persistence required at this stage.
* Usage of Redis to store currently online users.

## Improvements
* Proper authentication
* Error handling
* Use of Persistent Storage solutions to track users, and messages.
* Refactor code
* Testing for Javascript components
* UI redesign
