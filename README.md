# A Quick Introduction To Sinatra

## What Is Sinatra?

```
"Sinatra is a free and open source software web application library and domain-specific language written in Ruby." -Wikipedia
```

The focus of Sinatra is to allow you to quickly get a dynamic website up and running with minimal effort.

There is no real structure of where you put the front end materials (HTML, JS, CSS), the models, or the controller. You can leave everything in the root directory. The models and controller can be in the same file since they are both written in Ruby.

But for the sake of good practice, we will split it up so it'll be easy to find something when you want to work on a specific part of the website.

The _config.ru_ file here as well as the files in the _config_ directory sets up a lot of what you need for the structure to work properly. The setup is created by DBC and there are comments if you want to read what everything is doing.

## How To Get The Skeleton

1. Clone this repository.
2. Go to the _skeleton_ branch.
3. Copy and paste all the files into the directory of your choosing.
4. Change the README title to your project.

## Starting A Simple Server

1. _bundle install_
2. _bundle exec shotgun_

That is all there is to it since you have the skeleton. It has the main route and a very plain HTML file related to it.

Make sure you shutdown your server with __CTRL + C__. Don't ever just close the window. The server will continue to run if you do this so if you try to start your server again, you'll get an error.

### To Kill A Server

You will need to find the process ID of the shotgun server. Use this command:

```
ps | grep shotgun
```

This will return all processes that has the word shotgun in it, including the grep. Now you want to force quit the process with this command:

```
kill -9 <process id>
```

### What Is Shotgun And What Does It Do?

Shotgun is a Ruby gem that helps automatically restart the server when you make changes to your HTML, CSS, JS, model, or controller files. If you don't have Shotgun, you would have to go to the terminal, stop your server, and start it up again. It gets annoying if you forget and wonder why your changes aren't taking place. So it's good to have Shotgun.

Sometimes it might take a while for the changes to occur because the server is still working on the changes. If you reload and nothing changed, wait one or two more seconds then reload it again.

__Any changes you make to any file not in the app directory will require you to restart your server manually.__

## The Controller

The controller is the person who is handling all your requests. When you ask for something, it'll give you something back.

Because everything is already set up for you in the skeleton, you can create as many controller file as you want in the controller directory. You don't need to require it anywhere when you add new ones.

Even though every model has their own file for the controller, you still need to name the routes differently. When the code is compiled and ran, think of all the controllers being in one giant file.

If you have the route '/' in the index controller and the route '/' in the user controller file, it can cause conflict. The controller will only give you one of them. It doesn't automatically make it '/user' even though it's in the user controller file. You'll have to do it yourself.

In addition, you can have variables in your routes. You just need to have semi-colons in front of the word.

```
/user/:id
```

You wouldn't go to http://www.website.com/user/:id. It would most likely be http://www.website.com/user/13413.

To access that variable, you need to use the 'params' variable in the code block of the controller.

```ruby
GET /user/:id do
  params[:id] //this would be equal to 13413 in our example
end
```

### Things To Remember

For every model you have, you should have a controller file for it.

Put more specific routes at the top and anything with the params lower.

## The View

The view is the thing you see on your browser, the HTML file. But for Sinatra, we will be using ERB (embedded Ruby) files. This will allow us to use Ruby while as we use HTML. To use Ruby in the ERB file, you need to use what everyone here call snow cones.

### Snow Cones - <% %> & <%= %>: What's The Difference?

__<% %>__ is used when you just want to use Ruby code without people seeing it.

```
<% list.each do |item| %>
```

__<%= %>__ is used when you want to use Ruby and want people to see it.
```
<% list.each do |item| %>
  <%= item.name %>
<% end %>
```

### What Is The layout.erb File?

This file is what is going to be loaded every time you load a view.

See the part in the HTML that has <%= yield %>?

A simple way to explain what is happening is that you're copying all the HTML in your view file and pasting it where the yield is. That is actually what is being returned to you from the controller.

Something most people put in the layout file is the navigation bar. It's something you want on every page that loads.

### What Is A Partial?

As the name implies, it is a part of a bigger piece of the website. If there is a piece of HTML you want to use over and over again, you would put it inside a partial so you don't have to write it again and again (or copy and paste).

You don't have to worry about this for now, but you'll use it later when you learn AJAX.

### Things To Remember

For every GET route in your controller, you should have a view for it.

For every model you have, there should be a directory in the _views_ directory with the same name as that model.

## The Model

It's an object that contains information about itself. All the things you worked on with classes in Phase 1 is applied to models.

This is all stored in a database. We'll be using Postgres/ActiveRecord.

All the associations you've worked on in Phase 1 will be written in the model file.

## Setting Up Your Database

### How To Create A Database

We have a _Rakefile_. It contains a bunch of commands that'll help us create the database, migrations, and models easily.

To see a lists of all your rake commands:
```
bundle exec rake -T
```

To create your database:
```
bundle exec rake db:create
```

### What Is A Migration And How To Create One

A migration is a file that tells the database what properties the model (or class) will have.
```
bundle exec rake genereate:migration NAME=<name>
```

### How To Create A Model
```
bundle exec rake generate:model NAME=<name>
```

### Run Your Migration

You need to run a migration so your database knows what will be in it.

Every time you create a new migration and model, you just run the migration command. Everything created in the previous migration won't be over written.

```
bundle exec rake db:migrate
```

### Seed Your Database

If you want to fill your database with fake information for testing, you'll need to seed it. Check the seed file in the __db__ directory. It starts off blank and you just need to start writing Ruby code to create a new object.

Seed it with this command:
```
bundle exec rake db:seed
```

### Things To Remember

There are a few things to remember when working with a database. If you ever wonder why it isn't working or why there are errors, here are a few things to remember.

#### Make sure your create your database.

Very self explanatory.

#### Make sure you migrate and check it is successful.

Self explanatory again. I've helped many people and found that there was some kind of error when they migrate. They run the migrate command and think it's fine and when they see there is an error, they wonder what is going on.

#### Seed your database and make sure it is successful (optional).

If you wonder why all your seed data isn't showing up.

#### Never Drop Your Database

Treat it as if it had millions of user's information in it. If you need to update a property in an already existing model, run a migration. It's important to learn how to update models with new information. If you work at Facebook, you won't drop a database to give it new properties. You would create a migration. It's just good practice instead of taking the shortcut of dropping and recreating the database.

Two exceptions I can think of:

1. If you just started and just testing, it's fine to drop and recreate it.
2. If you're running out of time on your assessment, go ahead and do this. (But if you know how to do it, it wouldn't really take much time to begin with).

## Other Things

### Adding Gems

Very simple. It's exactly what you have done in Phase 1 so it isn't anything new.

1. Add the name of the gem in _Gemfile_.
2. Go to the terminal and type _bundle install_.
3. Go to _/config/environment.rb_ and require the name of the gem.

### Routing Stuff To Remember

1. GET routes always return a view or partial. The only exception is the '/' route. You might want to redirect it somewhere else.
2. POST, PUT, DELETE always redirect to another __route__.
3. Always put more specific routes higher up on the controller.