# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(
      :email => "admin@admin.com",
      :first_name => "Admin",
      :last_name => "User",
      :password => "123456",
      :password_confirmation => "123456",
      :role => "admin" 
  )
user.save!

public_project = Project.new(
		:name => "Project 1",
    :description => "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte.",
    :is_public => true,
    :estimated_effort => 8,
    :actual_effort => 10,
    :status => "created",
    :user => user
	)
	public_project.save!

private_project = Project.new(
		:name => "Project 2",
    :description => "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte.",
    :is_public => false,
    :estimated_effort => 6,
    :actual_effort => 7,
    :status => "created",
    :user => user
	)
	private_project.save!

