# require "bundler/capistrano" # UNCOMMENT THIS LINE IF YOU ARE USING BUNDLER
set :application, "extra_special_trust" # EDIT THIS TO MATCH YOUR APP NAME
set :deploy_to, "/var/www/#{application}"

set :user, "rt117admin#rails-trial-117.1steasy.net" # EDIT THIS TO MATCH YOUR SITE ADMIN NAME
set :use_sudo, false
ssh_options[:forward_agent] = true # USE THIS IF YOU ARE USING SSH KEYS

role :app, "rails-trial-117.1steasy.net" # EDIT THIS TO MATCH YOUR DOMAIN
role :web, "rails-trial-117.1steasy.net" # EDIT THIS TO MATCH YOUR DOMAIN
role :db,  "rails-trial-117.1steasy.net", :primary => true # EDIT THIS TO MATCH YOUR DOMAIN

desc "Create symlinks for chrooted environment"
task :chrooted_symlinks do
    # run "rm /var/www/passenger"
    run "cd /var/www && ln -s #{application}/releases/#{release_path.split('/').last} passenger"
    run "cd /var/www/#{application}/releases/#{release_path.split('/').last} && rm log && ln -s ../../shared/log"
    run "cd /var/www/#{application}/releases/#{release_path.split('/').last}/public && rm system && ln -s ../../../shared/system"
    run "cd /var/www/#{application}/releases/#{release_path.split('/').last}/tmp && rm pids && ln -s ../../../shared/pids"
end

namespace :deploy do
  task :start, :roles => :app do
  end

  task :stop, :roles => :app do
  end

  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :after_symlink, :roles => [:app, :web] do
    chrooted_symlinks
  end

end