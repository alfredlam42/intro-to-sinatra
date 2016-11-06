# A Quick Introduction To Sinatra

## What Is Sinatra?

"Sinatra is a free and open source software web application library and domain-specific language written in Ruby." -Wikipedia

The focus of Sinatra is to allow you to quickly get a website up and running with minimal effort.

There is no real structure of where you put the front end materials (HTML, JS, CSS), the models, or the controller. You can leave everything in the root folder. The models and controller can be in the same file since they are both written in Ruby.

But for the sake of good practice, we will split it up so it'll be easy to find something when you want to work on a specific part of the website.

The _config.ru_ file here as well as the files in the _config_ folder sets up a lot of what you need for the structure to work properly. The setup is created by DBC and there are comments if you want to read what everything is doing.

## How To Get The Skeleton

1. Clone this repository.
2. Go to the _skeleton_ branch.
3. Copy and paste all the files into the directory of your choosing.
4. Change the README title to your project.

## Starting Your Server

1. _bundle install_
2. _bundle exec shotgun_

## What Is Shotgun And What Does It Do?

Shotgun is a Ruby gem that helps automatically restart the server when you make changes to your HTML, CSS, JS, model, or controller files. If you don't have Shotgun, you would have to go to the terminal, stop your server, and start it up again. It gets annoying if you forget and wonder why your changes aren't taking place. So it's good to have Shotgun.

Sometimes it might take a while for the changes to occur because the server is still working on the changes. If you reload and nothing changed, wait one or two more seconds then reload it again.

## Adding Gems

Very simple. It's exactly what you have done in Phase 1 so it isn't anything new.

1. Add the name of the gem in _Gemfile_.
2. Go to the terminal and type _bundle install_.
3. Go to _/config/environment.rb_ and require the name of the gem.