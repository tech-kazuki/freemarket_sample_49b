# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "freemarket_sample_49b"
set :repo_url, "git@github.com:tech-kazuki/freemarket_sample_49b.git"

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :linked_files, %w{config/master.key}

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'

set :ssh_options, auth_methods: ['publickey'], keys: ['~/.ssh/freekazuki.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

# set :default_env, {
#   rbenv_root: "/usr/local/rbenv",
#   path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH",
#   AWS_ACCESS_KEY_ID: Rails.application.credential.aws[:access_key],
#   AWS_SECRET_ACCESS_KEY: Rails.application.credential.aws[:secret_access_key]
# }

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
  desc 'db_seed'
  task :db_seed do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end
end
