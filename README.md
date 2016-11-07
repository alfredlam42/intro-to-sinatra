# A Quick Introduction To Sinatra

## What Is Sinatra?

```
_"Sinatra is a free and open source software web application library and domain-specific language written in Ruby."_ -Wikipedia
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

## Starting Your Server

1. _bundle install_
2. _bundle exec shotgun_

That is all there is to it since you have the skeleton. It has the main route and a very plain HTML file related to it.

## What Is Shotgun And What Does It Do?

Shotgun is a Ruby gem that helps automatically restart the server when you make changes to your HTML, CSS, JS, model, or controller files. If you don't have Shotgun, you would have to go to the terminal, stop your server, and start it up again. It gets annoying if you forget and wonder why your changes aren't taking place. So it's good to have Shotgun.

Sometimes it might take a while for the changes to occur because the server is still working on the changes. If you reload and nothing changed, wait one or two more seconds then reload it again.

## The Controller

The controller is the person who is handling all your requests. When you ask for something, it'll give you something back.

Because everything is already set up for you in the skeleton, you can create as many controller file as you want in the controller directory. You don't need to require it anywhere when you add new ones.

#### Things To Remember

__For every model you have, you should have a controller for it.__

## The View

The view is the thing you see on your browser, the HTML file.

#### What Is The layout.html File?

This file is what is going to be loaded every time you load a view.

See the part in the HTML that has <%= yield %>?

A simple way to explain what is happening is that you're copying all the HTML in your view file and pasting it where the yield is. That is actually what is being returned to you from the controller.

#### Things To Remember

__For every GET route in your controller, you should have a view for it.__

__For every model you have, there should be a directory in the _views_ directory with the same name as that model.__

## Adding Gems

Very simple. It's exactly what you have done in Phase 1 so it isn't anything new.

1. Add the name of the gem in _Gemfile_.
2. Go to the terminal and type _bundle install_.
3. Go to _/config/environment.rb_ and require the name of the gem.