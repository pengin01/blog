require "bundler/capistrano"
set :application, "blog"
set :repository,  "git://github.com/johnsmith0707/blog.git"
set :deploy_to, "/tmp/capistrano_test"
set :use_sudo, false

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "192.168.50.3"                          # Your HTTP server, Apache/etc
role :app, "192.168.50.3"                          # This may be the same as your `Web` server
role :db,  "192.168.50.3", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do 
    run "cd #{current_path} && bundle exec rails s -p 3000 -d"
  end
  task :stop do 
    run "kill -9 `cat #{current_path}/tmp/pids/server.pid`"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
    #  run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
