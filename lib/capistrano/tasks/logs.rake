namespace :logs do
  desc "Tail Logs - cap <stage> logs:tail log_file=<name>"
  task :tail do
    on roles(:app) do
      execute_interactively "tail -n 10 -f #{shared_path}/log/#{ENV['log_file']}.log"
    end
  end

  desc "Tail nginx Logs - cap <stage> logs:nginx log_file=<name>"
  task :nginx do
    on roles(:app) do
      execute_nginx_interactively "sudo tail -n 10 -f /var/log/nginx/#{ENV['log_file']}.log"
    end
  end

  def execute_interactively(cmd)
    user = fetch(:user)
    info "Connection to #{host} as #{user}"
    exec "ssh -l #{user} #{host} -t 'cd #{deploy_to}/current && #{cmd}'"
  end
  def execute_nginx_interactively(cmd)
    user = fetch(:user)
    info "Connection to #{host} as #{user}"
    exec "ssh -l #{user} #{host} -t 'cd #{deploy_to}/current && #{cmd}'"
  end
end