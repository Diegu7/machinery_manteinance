# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new({
    username: 'admin',
    password: 'admin',
    password_confirmation: 'admin',
    first_name: 'admin',
    middle_name: 'admin',
    last_name: 'admin',
    email: 'admin@admin.org'
});

user.save;