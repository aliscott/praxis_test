# -p 8888

require 'bundler/setup'
require 'praxis'

require 'rack/cors'
use Rack::Cors do
  allow do
    origins '*'
    resource '*', :headers => :any, :methods => [:get, :post, :put, :delete, :options]
  end
end

application = Praxis::Application.instance
application.logger = Logger.new(STDOUT)
application.setup

run application
