# config valid for current version and patch releases of Capistrano
lock "~> 3.11.2"

set :puma_conf, "/home/ubuntu/aje/shared/config/puma.rb"
set :application, "aje"
set :repo_url, "https://github.com/doulmi/aje.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/ubuntu/aje"
set :use_sudo, true
set :branch, 'master'
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :linked_files, %w{config/master.key}
