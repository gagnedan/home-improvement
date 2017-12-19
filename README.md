# home-improvement

# Using rubyenv to installed and manage ruby version
brew install rbenv ruby-build  
# Add rbenv to bash so that it loads every time you open a terminal  
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
