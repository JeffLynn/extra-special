#JL 2013.06.27 Added in rdoc
#JL 2013.07.03 Using Rake 0.9.6 (last version before v10); commented out "mysql"
#JL 2013.07.24 Added gem jquery-rails (Error that jquery not found when I enabled the asset pipeline - I figured I might need it in the future)

source "http://rubygems.org"
gem 'rake'
#gem 'mysql'
gem "pg"
gem 'rails', '3.2.13'
gem 'ruby', '1.9.3'
gem 'proxies', '0.2.1'
gem 'be_valid_asset', '1.1.1'
gem 'mime-types','1.16'
gem "s3", "~> 0.3.12" #JL 2013.07.04 Upgraded
gem "paperclip", "~> 3.3.1" #JL 2013.07.04 Upgraded
gem "rdoc"
gem "jquery-rails"


group :test do
  gem "nokogiri", "~> 1.5.6" #JL 2013.07.04 Set the version - was getting warning about build version
  gem 'database_cleaner', '0.5.2'
#  gem "rspec", "~> 2.10.0" #JL 2013.07.19 Removed
  gem 'ruby-prof'
  gem "rspec-rails", "~> 2.10.0" #JL 2013.07.04 Upgraded
  gem "factory_girl_rails", "~> 3.6.0", :require => false #JL 2013.07.04 Upgraded from factory_girl
  gem 'gherkin'
  gem 'cucumber'#, '0.9.0'
  gem 'cucumber-rails', '0.3.2'
  gem 'capybara', '0.3.9'
  gem "pickle", '0.4.2'
  gem "launchy"
  # gem "ruby-debug"
  gem 'test-unit', '1.2.3'
end

group :development do
  gem "capistrano"
  gem "capistrano-ext"
end
