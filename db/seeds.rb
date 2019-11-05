# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.create(email: 'admin@ec.com', password: '1234567', password_confirmation: '1234567')
SecretCode.new(code: 'admin-12345', user_id: admin.id)