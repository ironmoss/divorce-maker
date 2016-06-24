# A sample Gemfile
source "https://rubygems.org"
ruby '2.3.0'

gem 'chartkick'

gem 'rake'
gem 'activesupport'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-activerecord'

gem 'puma'
gem 'tux'

# These gems are only installed when run as `bundle install --without production`
group :development, :test do
  gem 'pry'
  gem 'shotgun'
  gem 'pg'
  #gem 'sqlite3'
end

# bundle install --without test --without development
group :production do
  # use postgres in production, or move outside a group if your app uses postgres for development and production 
  gem 'pg'
end
