source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'active_storage_validations', '~> 0.9.0'
# gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
gem 'bootstrap', '~> 4.5', '>= 4.5.3'
gem 'bootstrap-will_paginate', '~> 1.0'
gem 'image_processing', '~> 1.12', '>= 1.12.1'
gem 'mini_magick', '~> 4.11'
gem 'will_paginate', '~> 3.3'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'jquery-rails'
gem 'sass-rails', '>= 6'
gem 'sprockets-rails', '~> 3.2', '>= 3.2.2'

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'rubocop', '~> 1.2'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

gem 'hirb', '~> 0.7.3'

gem 'faker', '~> 2.14'

gem 'devise'

group :development, :test do
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # help to kill N+1 queries and unused eager loading.
  gem 'bullet', '~> 6.1'
  gem 'table_print', '~> 1.5', '>= 1.5.7'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '~> 3.33'
  gem 'database_cleaner', '~> 1.8', '>= 1.8.5'
  # gem 'guard', '~> 2.16', '>= 2.16.2'
  # gem 'guard-rspec', '~> 4.7', '>= 4.7.3'
  gem 'guard-rspec', require: false
  gem 'selenium-webdriver', '~> 3.142', '>= 3.142.7'
  gem 'webdrivers', '4.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :production do
  gem 'aws-sdk-s3', require: false
end
