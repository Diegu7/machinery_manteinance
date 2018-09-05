# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end
ruby '>=2.4.0'
gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap-modal-rails', '~> 2.2', '>= 2.2.5'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'carrierwave', '~> 1.0'
gem 'cocoon'
gem 'coffee-rails', '~> 4.2'
gem 'font-awesome-rails', '~> 4.7'
gem 'ionicons-rails', '~> 2.0'
gem 'jbuilder', '~> 2.5'
gem 'jquery-datatables-rails', '~> 3.4.0'
gem 'jquery-rails', '~> 4.3'
gem 'paperclip', '~> 4.2'
gem 'pg', '~> 0.18.4'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.0'
gem 'rails-i18n', '~> 5.0.0'
gem 'sass-rails', '~> 5.0'
gem 'select2-rails'
gem 'sqlite3'
gem 'uglifier', '>= 1.3.0'
gem 'whenever', require: false
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
gem 'ice_cube'
gem "rubycritic", require: false



group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13.0'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rails_real_favicon'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :development, :test do
  gem 'coveralls', require: false
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'pry'
  gem 'pry-byebug'
  gem 'shoulda-matchers'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

gem 'rspec-rails', group: %i[development test]
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
