# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

set :application, "dubscale"
set :repo_url, "git@github.com:rahul1990gupta/project_dora.git"

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
# set :branch, :main

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/ubuntu/dubscale"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key', "config/credentials.yml.enc", 
# "config/deploy/production.rb"


# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
set :ssh_options, verify_host_key: :secure


namespace :deploy do
    task :copy_secrets do 
        on roles(:app) do 
            within release_path do 
                upload! 'config/master.key', "#{release_path}/config/master.key"
                upload! 'config/credentials.yml.enc', "#{release_path}/config/credentials.yml.enc"
                upload! 'config/deploy/production.rb', "#{release_path}/config/deploy/production.rb"
                upload! 'config/database.yml', "#{release_path}/config/database.yml"
            end
        end
    end

    # Install gems
    task :install do
        on roles(:app) do
            within release_path do
                execute "bundle", 'install RAILS_ENV=production'
            end
        end
    end
    
    # Run database migrations
    task :migrate do
        on roles(:db) do
            within release_path do
                execute :pwd
                execute "./bin/rails", 'db:migrate RAILS_ENV=production'
            end
        end
    end

    # Precompile assets
    task :precompile do
        on roles(:app) do
            within release_path do
                execute :rails, 'assets:precompile RAILS_ENV=production'
            end
        end
    end

    # Restart the app server (example with Unicorn)
    task :restart do
        on roles(:app) do
            execute "pkill -f puma"
            execute :rails, "server &"
        end
    end
end

# Ensure tasks are executed after code update
after 'deploy:updated', 'deploy:copy_secrets'
after 'deploy:updated', 'deploy:install'
after 'deploy:updated', 'deploy:migrate'
after 'deploy:updated', 'deploy:precompile'
after 'deploy:updated', 'deploy:restart'
