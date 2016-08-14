source 'https://rubygems.org'

gem 'rails', '~> 5.0.0'  # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'pg', '~> 0.18'  # Use postgresql as the database for Active Record

gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'puma', '~> 3.0' # Use Puma as the app server
gem 'sidekiq'
gem 'sidekiq-cron', '~> 0.4.0'  # scheduled sidekiq jobs
gem 'sinatra', require: nil   # sidekiq WebUI is sinatra-based app
gem 'redis'
gem 'redis-namespace'
gem 'redis-rails', '~> 5.0'
gem 'tether-rails'

# gem 'skejuler-aws', git: 'git@bitbucket.org:cloudescent/skejuler-aws.git', branch: 'master'
gem 'binding_of_caller'
gem 'bootstrap_form'

# asset pipeline
gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.2'  # Use CoffeeScript for .coffee assets and views
gem 'haml-rails' # Use HAML for templating

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# UI and model
gem 'jquery-rails'  # Use jquery as the JavaScript library
gem 'turbolinks', '~> 5'  # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'bootstrap', '~> 4.0.0.alpha3'
gem 'bh'
gem 'growlyflash' # replace flash message
gem 'kaminari'
gem 'country_select'
gem 'ice_cube' # recurring event model (iCal model: https://tools.ietf.org/html/rfc5545#section-3.6.1 )
gem 'rounding' # round time to nearest minute or for other rounding purpose

# website
gem 'high_voltage', '~> 3.0.0'

# authentication
gem 'devise'
gem 'devise-async'

# for production
gem 'lograge'

gem 'rubysl-securerandom', '~> 2.0'
group :development, :test do
  # debugging
  gem 'pry-rails'
  gem 'pry-byebug'
  # testing
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'faker'
  # send email in development environment
  gem 'letter_opener'  #  allows us to simulate the process of sending the email by creating it as a temporary file
  gem 'launchy'  # automatically opens the created temp file in a browser window so that the sending process becomes automatic and we have real-time confirmation that the email was sent correctly
  gem 'email_spec'
end

group :development do
  # Use Capistrano for deployment
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  # documentation
  gem 'annotate'
  gem 'yard'
  gem 'kramdown'
  # i18n
  gem 'i18n-tasks', '~> 0.9.5'
  # debugging
  gem 'web-console'  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'better_errors' # Better error page for debugging
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background.
  # Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end
