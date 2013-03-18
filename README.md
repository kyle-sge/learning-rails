# Learning Rails

## Overview

This repo is meant to be forked for your hands-on learning use.

The tasks in this repository will require the learner to be versed in Ruby.  Links to relevant readings will be provided for overviews of each topic.

Completion of these tasks will provide a brief overview of how one might approach creating the Rails framework and hopefully expose some interesting facets of Ruby to the learner.

While some tasks may be completed independently of others, other tasks will require successful completion of prior tasks.

## Topics
The following topics have exercises which may be tested by running "rake spec" in the exercise's directory.

Each exercise will have its own directory.

Hints are available in the /hints directory.

****

### Rack

#### Readings
+ Original [introduction](http://chneukirchen.org/blog/archive/2007/02/introducing-rack.html)
+ Succinct [primer](http://codefol.io/posts/14--What-is-Rack-A-Primer)
+ [RailsGuide](http://guides.rubyonrails.org/rails_on_rack.html)

#### Exercises
+ hello world
 + Create a simple Rack application that returns a response containing "Hello World" in the body of the response
+ hello world timer
 + Create a Rack middleware that consumes a Rack application and returns the response of the application with the time the consumed application took prepended to the body of the response
 + The test will create and consume an instance of the HelloWorld application

****

### Router

####  Readings
+ [RailsGuide](http://guides.rubyonrails.org/routing.html)

####  Exercises
+ Router
 + Create a simple router that can recognize the controller and action corresponding to the path (e.g. "/" => ["controller", "action"])

****

### ActiveRecord

#### Readings
+ [API](http://apidock.com/rails/ActiveRecord/Base)

#### Exercises
+ connection adapter
 + Create a simple connection adapter that allows sql to be executed on the opened connection and provides the helper methods described in the test
 + The sqlite3 gem is used to connect to the existing "shared/db/development.sqlite" database
+ basic active record
 + Create a basic implementation of the active record pattern by implementing the empty Base class of the BasicActiveRecord model
 + This class should use the connection adapter created earlier
 + The test uses a model that inherits from BasicActiveRecord::Base

****

### ActionController

#### Readings
+ [RailsGuide](http://guides.rubyonrails.org/action_controller_overview.html)

#### Exercises
+ basic controller
 + Create a basic controller class that processes an action on the controller that subclasses the basic controller
 + The Rendering module can be ignored for now
+ rendering
 + Create a rendering module that finds the correct erb file and renders it to the response
+ front controller
 + Rails dispatchs incoming requests to the appropriate controller and returns a Rack response
 + Create a front controller that uses the router that receives a Rack request, calls and renders the appropriate action, and returns the Rack response

****

### Associations

#### Readings
+ [Migrations RailsGuide](http://guides.rubyonrails.org/migrations.html)
+ [Associations RailsGuide](http://guides.rubyonrails.org/association_basics.html)

#### Exercises
+ associations
 + Add associations to the models to pass the tests
 + Write migrations in the db/migrate directory to create the tables backing the models