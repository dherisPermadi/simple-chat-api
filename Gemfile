source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'active_model_serializers', '~> 0.10.10'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise', '~> 4.8.1'
gem 'doorkeeper', '~> 5.5.4'
gem 'dotenv-rails', '~> 2.8.1'
gem 'enumerize', '~> 2.5.0'
gem 'kaminari', '~> 1.2.2'
gem 'rack-cors'
gem 'rails', '~> 7.0.3'
gem 'ransack', '~> 3.2.1', github: 'activerecord-hackery/ransack'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
