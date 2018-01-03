# Can I Buy? [![Build Status](https://travis-ci.org/hasken-14/can-i-buy.svg?branch=master)](https://travis-ci.org/hasken-14/can-i-buy) [![Dependency Status](https://beta.gemnasium.com/badges/github.com/hasken-14/can-i-buy.svg)](https://beta.gemnasium.com/projects/github.com/hasken-14/can-i-buy) [![Maintainability](https://api.codeclimate.com/v1/badges/14333236233f66a20c6e/maintainability)](https://codeclimate.com/github/hasken-14/can-i-buy/maintainability)

A simple tool which allows you to map all your savings, through different and unlimited profiles. Open source and built with Ruby on Rails, it's easy to customize and implement new features as you'd like.

## Supported Ruby versions

The app is currently working in Ruby __2.4.3__, __2.3.6__, __2.3.1__. You can see download and install instructions in the [official website](https://www.ruby-lang.org/en/).

## Trying before install

You can try _can-i-buy_ at our [Heroku app](https://can-i-buy.herokuapp.com/). 

Note about Heroku: as we use a free Heroku plan, if the monthly quota is exceeded, the app won't work until the month ends.

## Installing

First, you'll need git command line application. Download it [here](https://git-scm.com/downloads).
Now, clone the _can-i-buy_ repository by running `git clone https://github.com/hasken-14/can-i-buy.git`. A local copy of the code will be downloaded to your PC. Enter the folder _can-i-buy_ and run:

* `bundle install` to install all the Ruby gems which are required by this project;
* `rake db:migrate` to migrate the database.

Now, you're ready to locally host the project.

## Starting a local server

_can-i-buy_ uses [Puma](https://github.com/puma/puma) as default server. Type `rails s` to locally host the project.
Now, access it by your local IP address and the port provided by Rails, e.g. 127.0.0.1:3000. You can customize that port with `rails server -p NEW_PORT_HERE`.

## Testing

You can run the project tests simply by running `rake` at your terminal. You should do it before commiting any changes you make.

## Updating

If a new version is released at this GitHub repository and you want to update your local files, just type `git pull`.
