set :rails_env, "production"

set :rails_server, "cumulus.unboxedconsulting.com"

role :app, rails_server
role :web, rails_server
role :db,  rails_server, :primary => true

branch = ENV['TAG'].nil? ? 'master' : ENV['TAG']
set :branch, branch
