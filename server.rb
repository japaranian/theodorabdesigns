require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'mustache'
require 'HTTParty'

configure do
	enable :sessions
	set :session_secret, 'secret'
end

get ('/') do
	erb :index
end