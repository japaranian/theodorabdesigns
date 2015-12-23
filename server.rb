require 'sinatra'
require 'HTTParty'

configure do
	enable :sessions
	set :session_secret, 'secret'
end

get ('/') do
	erb :index
end