# Can I Buy? [![Build Status](https://travis-ci.com/hasken-14/can-i-buy.svg?token=dHqxCB8wzSA7nfMdNNda&branch=master)](https://travis-ci.com/hasken-14/can-i-buy) [![Maintainability](https://api.codeclimate.com/v1/badges/14333236233f66a20c6e/maintainability)](https://codeclimate.com/github/hasken-14/can-i-buy/maintainability) [![Coverage Status](https://coveralls.io/repos/github/hasken-14/can-i-buy/badge.svg?branch=master)](https://coveralls.io/github/hasken-14/can-i-buy?branch=master)

A simple tool which allows you to map all your savings, through different and unlimited profiles. Open source and built in Ruby on Rails, it's easy to customize and implement new features as you want.

## Supported Ruby versions

The app is currently working with Ruby __2.4.3__, __2.3.6__, __2.3.1__. You can download and see install instructions in the [official website](https://www.ruby-lang.org/en/).

## Trying before install

You can try _can-i-buy_ at our [Heroku app](https://can-i-buy.herokuapp.com/).

Note about Heroku: as we use a free Heroku plan, if the month's quota is exceeded, the app won't work until the month ends.

## Installing

At first, you'll need to install git command line application. Download it [here](https://git-scm.com/downloads).
Now, clone the _can-i-buy_ repository by running `git clone https://github.com/hasken-14/can-i-buy.git`. A local copy of the code will be downloaded to your PC. Enter the folder _can-i-buy_ and run:

* `bundle install` to install all the Ruby gems which are required by this project;
* `rake db:migrate` to migrate the database.

Now, you're ready to locally host the project.

## Starting a local server

_can-i-buy_ uses [Puma](https://github.com/puma/puma) as default server. Type `rails s` to locally host the project.
Now, access it by your local IP address and the port provided by Rails, e.g. 127.0.0.1:3000. You can customize that port with `rails server -p NEW_PORT_HERE`.

## Testing

You can run the project tests simply by running `rake` at your terminal. You should do it before committing any changes you make.

## Updating

If a new version had been released at this GitHub repository and you want to update your local files, just type `git pull`.
