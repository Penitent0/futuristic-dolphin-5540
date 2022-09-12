class AmusementPark < ApplicationRecord
  has_many :rides

  it 'has rides alpha method' do
    six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    expect(six_flags.rides_alpha).to eq([ferris, hurler, scrambler])
  end
end