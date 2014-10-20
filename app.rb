require 'sinatra/base'
require 'ncmb'

class Server < Sinatra::Base
  get '/' do
    NCMB.initialize application_key: ENV['APPLICATION_KEY'] || "",  client_key: ENV['CLIENT_KEY'] || ""
    @push = NCMB::Push.new
    @push.immediateDeliveryFlag = true
    @push.target = ['ios']
    @push.message = params["m"]
    @push.deliveryExpirationTime = "3 day"
    if @push.save
      status 201
      body ''
    else
      status 403
      body ''
    end
  end 
end
