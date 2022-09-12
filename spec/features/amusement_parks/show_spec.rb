require 'rails_helper'

RSpec.describe 'amusement park show page' do

  # Extension - Amusement Park Show page

  # As a visitor,
  # When I visit an amusement park’s show page
  # I see the name and price of admissions for that amusement park
  # And I see the names of all the rides that are at that theme park listed in alphabetical order
  # And I see the average thrill rating of this amusement park’s rides

  describe 'Extension - When I visit an amusement park’s show page' do
    before :each do
      @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
      @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

      @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
      @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

      @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
      @spinner = @universal.rides.create!(name: 'Spinner', thrill_rating: 1, open: true)
      @dropper = @universal.rides.create!(name: 'Dropper', thrill_rating: 3, open: true)
    end

    it 'I see the name and price of admissions for that amusement park' do
      visit "/amusement_parks/#{@six_flags.id}"
      
      expect(page).to have_content("Name: Six Flags")
      expect(page).to have_content("Admission: 75")

      visit "/amusement_parks/#{@universal.id}"

      expect(page).to have_content("Name: Universal Studios")
      expect(page).to have_content("Admission: 80")
    end

    it 'And I see the names of all the rides that are at that theme park listed in alphabetical order' do
      visit "/amusement_parks/#{@six_flags.id}"

      expect(page).to have_content(@hurler.name)
      expect(page).to have_content(@scrambler.name)
      expect(page).to have_content(@ferris.name)

      expect(@ferris.name).to appear_before(@hurler.name)
      expect(@hurler.name).to appear_before(@scrambler.name)
      expect(@scrambler.name).to_not appear_before(@ferris.name)

      visit "/amusement_parks/#{@universal.id}"

      expect(page).to have_content(@jaws.name)
      expect(page).to have_content(@spinner.name)
      expect(page).to have_content(@dropper.name)

      expect(@dropper.name).to appear_before(@jaws.name)
      expect(@jaws.name).to appear_before(@spinner.name)
      expect(@spinner.name).to_not appear_before(@dropper.name)
    end

    it 'And I see the average thrill rating of this amusement parks rides' do
      visit "/amusement_parks/#{@six_flags.id}"
      
      expect(page).to have_content("Average Thrill Rating: 6")

      visit "/amusement_parks/#{@universal.id}"

      expect(page).to have_content("Average Thrill Rating: 3")
    end
  end
end