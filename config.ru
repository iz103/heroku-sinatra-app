# require 'heroku-sinatra-app'

## There is no need to set directories here anymore;
## Just run the application

# run Sinatra::Application
run lambda { |env| [200, {'Content-Type'=>'text/plain'}, StringIO.new("Hello World!\n")] }

