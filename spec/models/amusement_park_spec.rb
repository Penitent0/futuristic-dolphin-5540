require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  it 'has rides alpha method' do
    six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    expect(six_flags.rides_alpha).to eq([ferris, hurler, scrambler])
  end

  it 'has average_ride_thrill method' do
    six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    expect(six_flags.average_ride_thrill).to eq(6)
  end
end