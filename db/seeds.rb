# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Role.create(name: "admin")
Role.create(name: "moderator")
Role.create(name: "student")
 u = User.new
 u.email = "admin@gmail.com"
 u.password = "secret123"
 u.role_id = Role.find_by_name("admin").id
u.save