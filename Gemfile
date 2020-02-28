source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'rack-cors', '~> 1.1.1'
gem 'knock', '~> 2.1.1'
gem 'monetize', '~> 1.9.4'
gem 'jsonapi-rails', '~> 0.4.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug', '~> 3.8'
  gem 'factory_bot_rails', '5.1.1'
  gem 'bullet', '~> 6.1.0'
  gem 'rswag', '~> 2.2.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', '~> 0.80', require: false
  gem 'reek', '~> 5.6.0'
end

group :test do
  gem 'rails-controller-testing', '~> 1.0.4'
  gem 'rspec-rails', '~> 3.9.0'
  gem 'simplecov', '~> 0.17.1', require: false
  gem 'shoulda-matchers', '~> 4.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
