require 'sinatra'

configure do
	enable :sessions
	set :session_secret, 'secret'
end

get ('/') do
	erb :index, 
	:layout => :layout do
		erb :layout
	end
end

get ('/contact') do
	erb :contact,
	:layout => :layout do
		erb :layout
	end
end

get ('/about') do
	erb :about,
	:layout => :layout do
		erb :layout
	end
end

get	('/events') do
	erb :events,
	:layout => :layout do
		erb :layout
	end
end

get	('/faq') do
	erb :faq,
	:layout => :layout do
		erb :layout
	end
end
