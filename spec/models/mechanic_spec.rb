require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  it { should have_many(:rides).through(:ride_mechanics) }

  it 'has average_years_experience class method' do
    barry = Mechanic.create!(name: "Barry", years_experience: 5)
    susan = Mechanic.create!(name: "Susan", years_experience: 2)
    molly = Mechanic.create!(name: "Molly", years_experience: 7)
    jimmy = Mechanic.create!(name: "Jimmy", years_experience: 4)

    expect(Mechanic.average_years_experience).to eq(4.5)
  end

  it 'shows only mechanic rides that are open' do
    six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    jaws = universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    barry = Mechanic.create!(name: "Barry", years_experience: 5)
    
    barry.rides << jaws
    barry.rides << ferris
    barry.rides << scrambler
    barry.rides << hurler

    expect(barry.rides_open).to eq([hurler, scrambler, jaws])
  end
end