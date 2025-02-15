# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AmusementPark.destroy_all
Ride.destroy_all

@six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
@universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

@hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
@scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
@ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

@jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

@barry = Mechanic.create!(name: "Barry", years_experience: 5)
@susan = Mechanic.create!(name: "Susan", years_experience: 2)
@molly = Mechanic.create!(name: "Molly", years_experience: 7)
@jimmy = Mechanic.create!(name: "Jimmy", years_experience: 4)
@phil = Mechanic.create!(name: "Phil", years_experience: 1)
@marty = Mechanic.create!(name: "Marty", years_experience: 6)

RideMechanic.create!(ride: @hurler, mechanic: @barry)
RideMechanic.create!(ride: @ferris, mechanic: @susan)
RideMechanic.create!(ride: @scrambler, mechanic: @molly)
RideMechanic.create!(ride: @jaws, mechanic: @jimmy)
RideMechanic.create!(ride: @scrambler, mechanic: @barry)
RideMechanic.create!(ride: @jaws, mechanic: @barry)