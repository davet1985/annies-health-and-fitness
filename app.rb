require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/twitter-bootstrap'
require 'haml'
require 'sass'
require 'pony'

class SeedApp < Sinatra::Base

  register Sinatra::Twitter::Bootstrap::Assets
  register Sinatra::Reloader

  get '/' do
    haml :index
  end

  get '/classes/:class/?' do
    class_name = 'classes/'+params[:class]
    haml class_name.to_sym
  end

  get '/contact/?' do
    haml :contact
  end

  post '/contact' do
    Pony.mail :to => 'davethompson21@gmail.com',
              :from => 'me@example.com',
              :subject => 'Howdy, Partna!'
    haml :contact
  end

  get '/styles.css' do
    scss :styles
  end

end