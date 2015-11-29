#PUMA DEPLOY.RB
#The following commands are not needed since chef solo does it for us! :)
#For new app do
#cap production setup:create_app_folder
#cap production setup:upload_db_yml
#cap production deploy
#cap production setup:nginx
# config valid only for Capistrano 3.1
lock '3.4.0'

set :application, 'brahma_demo'
set :repo_url, 'git@bitbucket.org:drumaddict/app.git'
set :user, 'spiros'
set :app_name,'brahma_demo'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/rails/apps/brahma_demo'

# Use agent forwarding for SSH so you can deploy with the SSH key on your workstation.
set :ssh_options, {
  forward_agent: true
}


## Defaults:
# set :scm,           :git
# set :branch,        :master
# set :format,        :pretty
# set :log_level,     :debug
# set :keep_releases, 5
# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
#set :linked_files, %w{config/database.yml}

set :linked_files, %w{config/database.yml .rbenv-vars .ruby-version}

# Default value for linked_dirs is []
set :linked_dirs, %w{ log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
set :default_env, { path: "/opt/rbenv/shims:$PATH" }

#set :bundle_bins, fetch(:bundle_bins, []).push("puma")

set :puma_user, fetch(:user)
#set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/puma/#{fetch(:app_name)}.state"
set :puma_pid, "#{shared_path}/puma/#{fetch(:app_name)}.pid"
set :puma_bind, "unix://#{shared_path}/puma/#{fetch(:app_name)}.sock"    #accept array for multi-bind
set :puma_default_control_app, "unix://#{shared_path}/tmp/sockets/pumactl.sock"
set :puma_conf, "#{shared_path}/puma/#{fetch(:app_name)}.config"
set :puma_access_log, "#{shared_path}/log/puma.stdout.log"
set :puma_error_log, "#{shared_path}/log/puma.stderr.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [1, 1]
set :puma_workers, 2
set :puma_worker_timeout, nil
set :puma_init_active_record, false
set :puma_preload_app, false
set :nginx_use_ssl, false
set :puma_init_active_record, true
set :puma_monit_service_name,"#{fetch(:app_name)}.puma"



# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

end


#CAPISTRANO DB-TASKS

require 'capistrano-db-tasks'

# if you haven't already specified
 set :rails_env, "production"

# if you want to remove the local dump file after loading
set :db_local_clean, true

# if you want to remove the dump file from the server after downloading
set :db_remote_clean, true

# if you want to exclude table from dump
set :db_ignore_tables, []

# if you want to exclude table data (but not table schema) from dump
set :db_ignore_data_tables, []

# If you want to import assets, you can change default asset dir (default = system)
# This directory must be in your shared directory on the server
# Assets
 #set :assets_dir, 'public/assets'
 #set :local_assets_dir, 'public'

# Uploads
set :assets_dir, 'public/uploads'
set :local_assets_dir, 'public'

# if you want to work on a specific local environment (default = ENV['RAILS_ENV'] || 'development')
set :locals_rails_env, "production"

# if you are highly paranoid and want to prevent any push operation to the server
set :disallow_pushing, false

# if you prefer bzip2/unbzip2 instead of gzip
set :compressor, :bzip2