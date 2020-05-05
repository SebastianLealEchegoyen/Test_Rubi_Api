# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Task.delete_all
Task.create([{name: 'Crear una API',dueDate: '2020-10-23 15:21:07', completed: 'true'},
             {name: 'Escapar de Neto',dueDate: '2020-05-04 15:21:07', completed: 'false'},
             {name: 'La vida',dueDate: '2020-12-13 15:21:07', completed: 'false'}])
