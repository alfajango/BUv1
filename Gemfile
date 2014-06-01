# need gem 'Origin' per http://mongoid.org/en/mongoid/docs/querying.html ?
source 'https://rubygems.org'
ruby '2.0.0'
#ruby '1.9.3'
gem 'rails', '3.2.14'
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'
gem 'devise'
gem 'devise_invitable'  #, '~> 1.3.4'
gem 'figaro'
gem 'mongoid'
gem 'bootstrap-sass'
gem "will_paginate_mongoid"

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'quiet_assets'
  gem 'rails_layout'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end
group :test do
  gem 'capybara'
  gem 'cucumber-rails', :require=>false
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'launchy'
  gem 'mongoid-rspec'
end

group :production do
  gem 'rails_12factor'
  gem 'thin'
end

