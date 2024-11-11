# install depenencies 
apt-get install autoconf patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev
apt-get install sqlite3

# install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
~/.rbenv/bin/rbenv init
rbenv install 3.3.5
rbenv blobal 3.3.5

# start server
tar -xvf project_dora.tar.gz 
cd project_dora/
bundle install


sudo ln -s $(which ruby) /usr/bin/ruby
sudo RAILS_ENV=production ./bin/rails db:migrate
 
## sudo RAILS_ENV=production ./bin/rails db:seed

RAILS_ENV=production rails assets:precompile
sudo RAILS_ENV=production ./bin/rails s -p 80