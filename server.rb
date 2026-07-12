require 'dotenv/load'
require 'sinatra'
require 'bundler/setup'
require 'cloudinary'

set :port, ENV['PORT'] || 4567
set :bind, '0.0.0.0'

configure do
  # puts "ENV session_secret length: #{ENV['session_secret']&.bytesize}"
	enable :sessions
	set :session_secret, ENV.fetch("SESSION_SECRET")
end

Cloudinary.config do |config|
  config.cloud_name = 'hptiz0can'
  config.api_key    = ENV.fetch('CLOUDINARY_API_KEY')
  config.api_secret = ENV.fetch('CLOUDINARY_API_SECRET')
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
  projects = [
    { category: "New Construction",       location: "Watchung, NJ",       folder: "images/croffie" },
    { category: "Renovation",             location: "Jersey City, NJ",    folder: "images/soler-jersey-city-residential" },
    { category: "Renovation",             location: "Warren, NJ",         folder: "images/loureiro_residence" },
    { category: "New Construction",       location: "Jackson, NJ",        folder: "images/joseph_residence" },
    { category: "Exterior Covered Patio", location: "Millstone, NJ",      folder: "images/varricchio" },
    { category: "Interior Renovation",    location: "Tappan, NY",         folder: "images/patel_residence" },
    { category: "Renovation",             location: "Ridgewood, NJ",      folder: "images/181_west_end" },
    { category: "New Construction",       location: "Rutherford, NJ",     folder: "images/barry_residence" },
    { category: "Renovation",             location: "Rutherford, NJ",     folder: "images/smith_residence" },
    { category: "Renovation",             location: "Crandon Lakes, NJ",  folder: "images/hw_residence" },
    { category: "New Construction",       location: "Rutherford, NJ",     folder: "images/carmita_residence" },
    { category: "New Construction",       location: "Rutherford, NJ",     folder: "images/rutherford_residence" },
    { category: "Renovation",             location: "Haworth, NJ",        folder: "images/trinidad_residence" }
  ]

  projects.each do |project|
    result = Cloudinary::Api.resources(type: 'upload', prefix: project[:folder], max_results: 100)
    project[:images] = result['resources'].map { |r| r['secure_url'] }
    project[:gallery] = project[:folder].split('/').last.gsub('_', '-')
  end

  erb :residential, locals: { projects: projects }
end

get ('/commercial') do
  projects = [
    { category: "Restaurant Renovation", name: "Ava's Kitchen & Bar",           location: "Kenilworth, NJ",  folder: "images/ava_bar_kitchen" },
    { category: "Church Renovation",     name: "St. George Community Center",  location: "Piscataway, NJ",  folder: "images/st-george-commercial" },
    { category: "Church Renovation",     name: "First Baptist Church",         location: "South Orange, NJ", folder: "images/first_baptist_church" }
  ]

  projects.each do |project|
    result = Cloudinary::Api.resources(type: 'upload', prefix: project[:folder], max_results: 100)
    project[:images] = result['resources'].map { |r| r['secure_url'] }
    project[:gallery] = project[:folder].split('/').last.gsub('_', '-')
  end

  erb :commercial, locals: { projects: projects }
end

get ('/interior') do
  projects = [
    { category: "New Construction",  location: "Watchung, NJ",    folder: "images/croffie-watchung" },
    { category: "Renovation",        location: "Jersey City, NJ", folder: "images/soler-jersey-city" },
    { category: "Church Renovation", name: "St. George Community Center", location: "Piscataway, NJ", folder: "images/st-george-community-center" }
  ]

  projects.each do |project|
    result = Cloudinary::Api.resources(type: 'upload', prefix: project[:folder], max_results: 100)
    project[:images] = result['resources'].map { |r| r['secure_url'] }
    project[:gallery] = project[:folder].split('/').last.gsub('_', '-')
  end

  erb :interior, locals: { projects: projects }
end

get ('/about-tbd') do
  erb :abouttbd
end