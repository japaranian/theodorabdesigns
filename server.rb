require 'sinatra'

configure do
	enable :sessions
	set :session_secret, 'secret'
end

get ('/') do
	erb :index
end

get ('/contact') do
	erb :contact
end

get ('/about') do
	erb :about
end