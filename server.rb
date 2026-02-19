require 'sinatra'
require 'bundler/setup'

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

get	('/events') do
	erb :events
end

get	('/faq') do
	erb :faq
end

get ('/residential') do
  erb :residential
end

get ('/commercial') do
  erb :commercial
end