# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@mechanic_1 = Mechanic.create(name: "Frank",
                              years_experience: "12")
@mechanic_2 = Mechanic.create(name: "Jane",
                              years_experience: "5")
@mechanic_3 = Mechanic.create(name: "Bob",
                              years_experience: "2")
@park_1 = Park.create(name: "Disney",
                      admission_price: 50)
@park_2 = Park.create(name: "Harry Potter",
                      admission_price: 70)

@ride_1 = @park_1.rides.create(name: "Upside Down",
                      thrill_rating: 7)
@ride_2 = @park_1.rides.create(name: "Tea Cups",
                      thrill_rating: 3)
@ride_3 = @park_2.rides.create(name: "Hedwigs flight",
                      thrill_rating: 8)
MechanicRide.create(ride_id: @ride_1.id, mechanic_id: @mechanic_1.id)
MechanicRide.create(ride_id: @ride_3.id, mechanic_id: @mechanic_1.id)
