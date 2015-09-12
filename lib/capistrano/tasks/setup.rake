require 'sshkit'
require 'sshkit/dsl'
namespace :setup do

  desc "Upload database.yml file."
  task :upload_yml do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/config"
      upload! StringIO.new(File.read("config/database.yml")), "#{shared_path}/config/database.yml"
    end
  end

  # desc "Seed the database."
  # task :seed_db do
  #   on roles(:app) do
  #     within "#{current_path}" do
  #       with rails_env: :production do
  #         execute :rake, "db:seed"
  #       end
  #     end
  #   end
  # end
  desc "Create nginx config"
    task :create_nginx_conf do
      nginx_config = ERB.new <<-EOF
      server {
              listen 80 ;
              server_name #{fetch(:application)}.188.226.189.157.xip.io  www.#{fetch(:application)}.188.226.189.157.xip.io;

              passenger_enabled on;
              passenger_ruby /usr/local/rvm/gems/ruby-2.2.1/wrappers/ruby;
              passenger_friendly_error_pages on;

              rails_env    production;

              root /var/www/#{fetch(:application)}/current/public;
              index index.html index.htm;

              access_log /var/www/#{fetch(:application)}/current/log/nginx.access.log;
              error_log /var/www/#{fetch(:application)}/current/log/nginx.error.log info;

              location ^~ /assets/ {
                gzip_static on;
                expires max;
                add_header Cache-Control public;
              }

              # redirect server error pages to the static page /50x.html
              error_page   500 502 503 504  /50x.html;
              location = /50x.html {
                  root   html;
              }
      }
      EOF
      put nginx_config.result, "#{current_path}/config/nginx.conf"
    end


  desc "Create new application folder,symlink the server block."
    task :new_app do
      on roles(:app) do
          #ask(:app_folder, 'Please enter the name of the new application\'s folder', echo: true)
          execute "sudo mkdir -p /var/www/#{fetch(:application)}"
          execute "sudo chown -R deploy:deploy /var/www/#{fetch(:application)}"
          execute "sudo ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
    end
  end

  desc "Symlinks config files for Nginx"
  task :symlink_nginxconf do
    on roles(:app) do
     execute "sudo ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
   end
  end

end