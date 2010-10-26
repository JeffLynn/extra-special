set :stages, %w(staging production)
set :default_stage, "staging"

set :application, "extra_special_trust"
set :user, "extra_special_trust"

set :deploy_to,   "/home/#{user}/#{application}"

begin
  require 'capistrano/ext/multistage'
rescue LoadError
  puts "Could not load capistrano multistage extension.  Make sure you have installed the capistrano-ext gem"
end

default_run_options[:pty] = true

set :scm, :git
set :repository, "git@code.unboxedconsulting.com:#{application}.git"
set :ssh_options, { :forward_agent => true }
set :deploy_via, :remote_cache

set :use_sudo, false

namespace :deploy do

  after "deploy:setup", "deploy:initial_setup"
  task :initial_setup do
    run "mkdir -p #{shared_path}/config"
    put File.read(File.join(File.expand_path(File.dirname(__FILE__)), "database.yml.example")), "#{shared_path}/config/database.yml", :mode => 0600
    put <<EOT, "#{shared_path}/system/maintenance.cgi", :mode => 0755
#!/bin/sh

cat <<EOF
Status: 503 Service Temporarily Unavailable
Content-Type: text/html; charset=UTF-8
Retry-After: 600

EOF

cat ./maintenance.html
EOT
    #run "mkdir -p #{shared_path}/assets"
    #put File.read(File.join(File.expand_path(File.dirname(__FILE__)), "application.yml")), "#{shared_path}/config/application.yml", :mode => 0600
  end

  after "deploy:finalize_update", "deploy:symlink_configs"
  task :symlink_configs do
    run "ln -fs #{shared_path}/config/database.yml #{latest_release}/config/database.yml"
    #run "ln -fs #{shared_path}/config/application.yml #{latest_release}/config/application.yml"
    #run "rm -rf #{latest_release}/public/assets && ln -s #{shared_path}/assets #{latest_release}/public/assets"
  end

  # after "deploy:symlink", "deploy:flush_memcached"
  # desc "Flush memcached"
  # task :flush_memcached, :roles => :db, :only => { :primary => true } do
  #   run "cd #{current_path} && rake RAILS_ENV=#{rails_env} milkshake:flush_memcached"
  # end

  # Clean up old releases (by default keeps last 5)
  after "deploy:update_code", "deploy:cleanup"

  task :start, :roles => :app do
  end

  desc "Restart the app"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
    sleep 5
  end

  task :stop, :roles => :app do
  end

  namespace :web do

    before "deploy", "deploy:web:disable"
    before "deploy:migrations", "deploy:web:disable"

    # To use a custom maintenance page, put it in /public/maintenance.html, and uncomment this
    # desc "Present a maintenance page to visitors."
    # task :disable, :roles => :web, :except => { :no_release => true } do
    #   on_rollback { run "rm #{shared_path}/system/maintenance.html" }
    # 
    #   run "cp #{current_path}/public/maintenance/maintenance.html #{shared_path}/system/"
    # end

    after "deploy", "deploy:web:enable"
    after "deploy:migrations", "deploy:web:enable"
    # Default web:enable task is fine

  end
end
