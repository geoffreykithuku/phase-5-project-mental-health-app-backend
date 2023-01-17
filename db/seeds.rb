# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Seeding Doctors...."

Doctor.create!([
    {name: Faker::Name.name, email: "sam@gmail.com"},
    {name: Faker::Name.name,email:"janedoe@gmail.com"},
    {name: Faker::Name.name, email: "owne@gmail.com"},
    {name: Faker::Name.name, email: "mark@gmail.com"},
    
    {name: Faker::Name.name, email: "sweets@gmail.com"},
    {name: Faker::Name.name, email: "yougotit@gmail.com"},
    {name: Faker::Name.name, email: "doctormania@gmail.com"},
    {name: Faker::Name.name, email: "counsellorspecialist@gmail.com"}])

puts "Done seeding Doctors"

puts "Seeding Patients"
Patient.create!([
    {name: Faker::Name.name, email: "airtrace@snakebutt.com"},
    {name: Faker::Name.name, email: "cottonmerely@lilspam.com"},
    {name: Faker::Name.name , email:"casemeant@chewydonut.com"},
    {name: Faker::Name.name, email: "casavera@gmail.com"},

    {name: Faker::Name.name, email: "needgreem@gmail.com"},
    {name: Faker::Name.name, email: "ineedhelp@gmail.com"},
    {name: Faker::Name.name, email: "markmasaai@gmail.com"},
    {name: Faker::Name.name, email: "tanasahadangote@gmail.com"},
    {name: Faker::Name.name, email: "yego254@gmail.com"}])

puts "Done Seeing Patients"


