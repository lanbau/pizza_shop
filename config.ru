require 'rubygems'
require 'bundler'
Bundler.require

require './models/pizza'
require './app'

use Rack::MethodOverride
run PizzaShop
