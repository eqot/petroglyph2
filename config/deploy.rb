#require "bundler/capistrano"

set :application, "petroglyph"

#set :domain, "dummy.com"

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server


### Deployment

set :user, "ec2-user"
set :use_sudo, false
set :repository, "./"
set :deploy_to, "/usr/share/nginx/rails/petroglyph/"
set :scm,             :none
set :deploy_via,      :copy
set :copy_exclude, [".git", "**/.git", ".DS_Store", ".svn", "**/.svn", "**/scss", "public/**/config.rb", "coverage"]
default_run_options[:pty] = true

namespace :deploy do
  task :restart, :except => { :no_release => true } do
    #do nothing.
  end

  task :finalize_update, :except => { :no_release => true } do
    run "mv -f #{latest_release}/config/database.yml.custom #{latest_release}/config/database.yml"
  end
end

after "deploy:restart", "deploy:cleanup"
set :keep_releases, 5


### Unicorn

set :unicorn_pid, "/var/tmp/unicorn.pid"

namespace :unicorn do
  task :restart do
    run "kill -USR2 `cat #{unicorn_pid}`"
    run "kill -QUIT `cat #{unicorn_pid}.oldbin`"
  end
end

after "deploy:restart", "unicorn:restart"


### Growl

after "deploy:restart" do
  system("which -s growlnotify && growlnotify -n 'Capistrano' -t 'Capistrano' -m 'Completed.'")
end

after "deploy:rollback" do
  system("which -s growlnotify && growlnotify -n 'Capistrano' -t 'Capistrano' -m 'Failed.' -p -1")
end
