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
end