# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Animal.validates :aname, uniqueness: true, on: :create
# 1500.times do
#     Animal.create({
#         aname: Faker::Creature:: Animal.name
#     })
# end

# Animal.clear_validators!

require 'csv'

CSV.foreach('public\animals.csv', headers: true) do |row|
  Animal.create!(id: row['id'], aname: row['aname'], created_at: row['created_at'], updated_at: row['updated_at'])
end