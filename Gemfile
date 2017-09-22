source 'https://rubygems.org'

gem 'rails', '4.2.9'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.20.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
gem 'devise'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'bootstrap_form'
gem 'devise_invitable', '~> 1.7.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# For handling roles in admin panel
gem 'cancancan','~> 1.10'
# Data Table to display data
gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'
# For facebook Authentication
gem 'omniauth-facebook'
# Google plus authenticaton
gem 'omniauth-google-oauth2' 
# For having Google captcha
gem 'recaptcha', :require => 'recaptcha/rails'

gem 'google-api-client', '~> 0.11', require: 'google/apis/calendar_v3'
# To have proper pagination
gem 'will_paginate', '~> 3.1.0'
# To have a like button for posts, acts_as_votable gem is used
gem 'acts_as_votable', '~> 0.10.0'
# To keep a check on eager loading and caching
gem 'bullet', group: :development
# To keep a check on usused css
gem 'deadweight'
# to have HAML in place of erb
gem 'haml-rails'

group :development, :test do
  gem 'rspec-rails'
end

group :test do
	gem 'database_cleaner'
	gem 'capybara'
end	

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background.
  gem 'spring'
end

