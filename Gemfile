# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'coffee-rails', '~> 4.2'
gem 'jbuilder',     '~> 2.5'
gem 'pg',           '~> 0.18'
gem 'puma',         '~> 3.7'
gem 'rails',        '~> 5.1.1'
gem 'rubocop',      '~> 0.49.1', require: false
gem 'sass-rails',   '~> 5.0'
gem 'uglifier',     '>= 1.3.0'

group :development, :test do
  gem 'byebug',            platforms: %i[mri mingw x64_mingw]
  gem 'capybara',          '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console',           '>= 3.3.0'
end

group :test do
  gem 'codeclimate-test-reporter', '~> 1.0.0'
  gem 'simplecov'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Turbolinks makes navigating your web application faster.
# Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
