#require "bundler/capistrano"

set :application, "petroglyph"
# set :repository,  "set your repository location here"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :domain, "dummy.com"

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

set :user, "ec2-user"
set :use_sudo, false
set :repository, "./"
set :deploy_to, "/usr/share/nginx/rails/petroglyph/"
set :scm,             :none
set :deploy_via,      :copy
set :copy_exclude, [".git", "**/.git", ".DS_Store", ".svn", "**/.svn", "**/scss", "public/**/config.rb"]
default_run_options[:pty] = true
