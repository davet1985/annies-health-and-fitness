require 'rubygems'
require 'bundler'
require 'sinatra'
require 'haml'
require './app'
 
set :run, false
set :raise_errors, true
 
run SeedApp