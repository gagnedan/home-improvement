# README 

**Ruby version** : ruby 2.4.3p205

**Specific GEM** : Devise, OmniAuth, OmniAuth-Facebook, CanCanCan, bootstrap-sass, sass-rails, jquery-rails, react-rails

 **PostgreSQL développement database creation** : 
	 
	 1. rake db:create
	 2. rake db:migrate 
	 3. rake db:seed
	 
	* Creation automatique de l'administrateur
		 * email : admin@admin.com
		 * password : 123456

	 * Creation automatique de l'usager Luke
		 * email : luke@disney.com
		 * password : 123456

	 * Creation automatique de l'usager Leia
		 * email : leia@disney.com
		 * password : 123456
	
	 * Deux projets seront créer un privée et l'autre public
		 * Le projet privé appartient à Leia
		 * Le projet appartient public à Luke
	 
	 * Deux commentaires sont déja inclus pour le projet public
	 
**PostgreSQL test database creation**

 - rake db:test:prepare
	 
**Les spécifications et restrictions** voir "apps/model/ability.rb"

 - Tout les utilisateurs peuvent voir les projets public ainsi que leur commentaires
 - Si un projet est privé, seul le propriétaire du projet pourra le voir
 - Les projets privés sont fermés aux commentaires
 - Tout les utilisateurs peuvent ajouter des commentaires sur le projet est public
 - Un utilisateur peut modifier un projet public cependant il ne peux pas changer le nom, les efforts ainsi que la visibilité
 - Si le projet appartient à l'utilisateur lors de la modification, il peux modifier tout les éléments du projet.
 - Un administrateur peut lire les commentaires mais ne peux commenter.
 - Un administrateur peux voir tout les projets de tout les utilisateurs
 - Un administrateur peux supprimer tout les projets, commentaires ou utilisateurs
 - Un administrateur peux modifier un projet mais seulement le nom et la description
 - Un administrateur peux modifier tout les commentaires.

**How to run the test suite**

 - rake test
 - Les tests sont dans "test/controllers" et les fixtures dans "test/fixtures"

**Facebook Login**

 - Utilisation de OmniAuth for Facebook. 
 - J'ai créer un compte développeur à partir de mon compte facebook
 - Fonctionne pour le host : http://localhost:3000/

**UI Design**

 - Utilisation de bootstrap SASS
 - Creation d'un component block "block.scss" utiliser à travers l'application
 - Overrides de quelques classes de bootstrap
 - Un fichier "utilities.scss" pour simplifier la mise en page de certain éléments
 - Un fichier "variables.scss" pour injecter les constantes par défaut

**React**

 - Les commentaires pour l'interface utilisateur à été créer en composante React
 - Utilisation de Jbuilder pour simplifier les modèle en JSON
 - Les appels Ajax sont fait à partir de JQuery

**Real-time Javascript**

 - Utilisation d'un Action Cable pour la suppression des projets
 - Ouvrir deux fureteurs côte à côte.
 - Brancher vous administrateur, ouvrer le fureteur de gauche à la page des projets de l'application dans l'interface utilisateur.
 - Ouvrer le fureteur de droite à la page d'édition des projets dans l'interface administrateur.
 - Supprimer un projet à partir de l'interface administrateur, il disparaitra automatiquement de la vue de l'interface utilisateur.

**Interface Administration**

 - Disponible seulement pour l'administration
 - Créer dans son propre namespace.

# Personal note : Mac osx Setup

Using rubyenv to installed and manage ruby version

 - brew install rbenv ruby-build 

Loads rubyenv every time you open a terminal  

 - echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
 - source ~/.bash_profile

Install Ruby

 -  rbenv install 2.4.3
 - rbenv global 2.4.3 
 - ruby -v

Intalling PostgreSQL

 - brew install postgresql 
 - PG as a service : brew services start postgresql
 - postgresql user is your current OS X username with no password
 - rails new home-improvement -d postgresql