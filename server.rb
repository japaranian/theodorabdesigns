require 'sinatra'
require 'bundler/setup'

configure do
  # puts "ENV session_secret length: #{ENV['session_secret']&.bytesize}"
	enable :sessions
	set :session_secret, ENV.fetch("SESSION_SECRET")
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