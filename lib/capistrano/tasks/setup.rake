require 'sshkit'
require 'sshkit/dsl'
namespace :setup do

#For new app do
#cap production setup:create_app_folder
#cap production setup:upload_db_yml
#cap production deploy
#cap production setup:nginx


  desc "Create new application folder,symlink the server block."
    task :create_app_folder do
      on roles(:app) do
          execute "sudo mkdir -p /var/www/#{fetch(:application)}"
          execute "sudo chown -R deploy:deploy /var/www/#{fetch(:application)}"
    end
  end

  desc "Create nginx config"
    task :create_nginx_conf do
      on roles(:app) do
      upload! StringIO.new(File.read("config/nginx.conf")), "#{shared_path}/config/nginx.conf"
    end
  end


  desc "Symlinks config files for Nginx"
  task :symlink_nginx_conf do
    on roles(:app) do
     execute "sudo ln -nfs #{shared_path}/config/nginx.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
   end
  end

  desc "Upload database.yml file."
  task :upload_db_yml do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/config"
      upload! StringIO.new(File.read("config/database.yml")), "#{shared_path}/config/database.yml"
    end
  end


  desc "Create and Symlink nginx.conf"
  task :nginx do
    on roles(:app) do
      within "#{current_path}" do
        with rails_env: :production do

          invoke  'setup:create_nginx_conf'
          invoke  'setup:symlink_nginx_conf'
          execute "sudo service nginx restart"
        end
      end
    end
  end

end