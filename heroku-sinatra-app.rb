# You'll need to require these if you
# want to develop while running with ruby.
# The config/rackup.ru requires these as well
# for it's own reasons.
#
# $ ruby heroku-sinatra-app.rb
#
require 'rubygems'
require 'sinatra'
require 'rest_client'
require 'pry'
require 'json'

configure :production do
  # Configure stuff here you'll want to
  # only be run at Heroku at boot

  # TIP:  You can get you database information
  #       from ENV['DATABASE_URI'] (see /env route below)
end

# format :json
# Quick test

class Google
  def initialize(query)
    @query = query
  end
  
  def response
      key = 'AIzaSyBEMGBPjHVqlfSZH2-ppPhRo0wHX6hLKT8'
      url = "https://www.googleapis.com/shopping/search/v1/public/products?country=AU&q=vintage+decor+#{@query}&rankBy=price:ascending&key=#{key}"
      products = JSON.parse(RestClient.get(url))
  end
end
# a["items"][0]["product"]["link"]

get '/' do 
  erb :form
end

post '/form' do
  params[:q] = params[:q].gsub(/\s/, '+')
  search = Google.new(params[:q])
  @results = search.response
  erb :results
end


# Test at <appname>.heroku.com

# You can see all your app specific information this way.
# IMPORTANT! This is a very bad thing to do for a production
# application with sensitive information

# get '/env' do
#   ENV.inspect
# end
