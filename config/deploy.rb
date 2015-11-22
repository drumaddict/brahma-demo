#UNICORN DEPLOY.RB
#The following commands are not needed since chef solo does it for us! :)
#For new app do
#cap production setup:create_app_folder
#cap production setup:upload_db_yml
#cap production deploy
#cap production setup:nginx

# config valid only for Capistrano 3.3.5 (3.4.0)
lock '3.4.0'

set :application, 'brahma_demo'
set :repo_url, 'git@bitbucket.org:drumaddict/app.git'
set :user, 'root'

# Default branch is :master
#ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/rails/apps/brahma_demo'
set :unicorn_service, 'brahma_demo'

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

set :bundle_bins, fetch(:bundle_bins, []).push("unicorn")

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :unicorn do

  %w[start stop restart full-restart reload add-worker remove-worker status].each do |command|
    desc "#{command} unicorn"
    task command do
      on roles :app, except: {no_release: true} do
        sudo 'service', fetch(:unicorn_service), command
      end
    end
  end

end

namespace :deploy do
  after :publishing, 'unicorn:restart'
end
