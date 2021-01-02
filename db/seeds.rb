# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Criando CATEGORIAS...."
categories = ["Animais e Acessorios",
"Esporte",
"Para a sua casa",
"Eletronicos e Celulares",
"Musica e hobbies",
"Bebes e crianças",
"Moda e Beleza",
"Veiculos e Barcos",
"Imoveis",
"Empregos e Negocios"]

categories.each do |categoriess|
    Category.find_or_create_by!(description: categoriess )
end    
puts "CATEGORIAS casdastradas com Sucesso!!!"

puts "CRIANDO Administrador!!!"
    Admin.create!(name:"admin", email: "admin@gmail.com", password: "123456", password_confirmation: "123456", role: 0)
puts "Administrador casdastrado com Sucesso!!!"