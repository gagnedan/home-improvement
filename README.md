# README

* Ruby version : ruby 2.4.3p205

* Specific GEM : Devise, OmniAuth, OmniAuth-Facebook, CanCanCan

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
=======
# home-improvement

# Using rubyenv to installed and manage ruby version
brew install rbenv ruby-build  
# Loads rubyenv every time you open a terminal  
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile  
source ~/.bash_profile  

# Install Ruby
rbenv install 2.4.3  
rbenv global 2.4.3  
ruby -v  

# Intalling PostgreSQL
brew install postgresql  
Start PG by hand : pg_ctl -D /usr/local/var/postgres start  
PG as a service : brew services start postgresql   
postgresql user is your current OS X username with no password  
rails new home-improvement -d postgresql 
# Create the database
rake db:create

# Temps sur le projet
1. Setup : 30 minutes
2. Intégration de Devise : 1 heure
3. Intégration de OmniAuth pour Facebook : 1 heure
