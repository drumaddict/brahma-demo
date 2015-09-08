# config valid only for current version of Capistrano
lock '3.4.0'

#server '188.226.189.157', user: 'deploy', port: 22, roles: [:web, :app, :db], primary: true
set :application, 'brahma-front'
set :repo_url, 'git@bitbucket.org:drumaddict/app.git'
set :user,            'deploy'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/#{fetch(:application)}"

#set :stage,           :production

# Default value for :pty is false
set :pty, true


## Defaults:
# set :scm,           :git
# set :branch,        :master
# set :format,        :pretty
# set :log_level,     :debug
# set :keep_releases, 5

# Default value for :linked_files is []
#set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}


# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

#PASSENGER
# set :passenger_roles, :app
# set :passenger_restart_runner, :sequence
# set :passenger_restart_wait, 5
# set :passenger_restart_limit, 2
# set :passenger_restart_with_sudo, false
# set :passenger_environment_variables, {}
# set :passenger_restart_command, 'passenger-config restart-app'
# set :passenger_restart_options, -> { "#{deploy_to} --ignore-app-not-running" }

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

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
set :disallow_pushing, true

# if you prefer bzip2/unbzip2 instead of gzip
set :compressor, :bzip2