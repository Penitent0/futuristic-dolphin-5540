require 'rails_helper'

RSpec.describe 'mechanics show page' do
  # Story 2 - Mechanic Show Page

  # As a user,
  # When I visit a mechanic show page
  # I see their name, years of experience, and the names of rides they’re working on
  # And I only see rides that are open
  # And the rides are listed by thrill rating in descending order (most thrills first)

  describe 'Story 2 - When I visit a mechanic show page' do
    before :each do
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
      RideMechanic.create!(ride: @scrambler, mechanic: @susan)
      RideMechanic.create!(ride: @scrambler, mechanic: @molly)
      RideMechanic.create!(ride: @jaws, mechanic: @jimmy)
      RideMechanic.create!(ride: @ferris, mechanic: @jimmy)
      RideMechanic.create!(ride: @scrambler, mechanic: @barry)
      RideMechanic.create!(ride: @jaws, mechanic: @barry)
    end

    it 'I see their name, years of experience, and the names of rides they’re working on' do
      visit "/mechanics/#{@barry.id}"

      expect(page).to have_content("Name: Barry")
      expect(page).to_not have_content("Susan")
      expect(page).to_not have_content("Molly") 
      
      expect(page).to have_content("Years: 5")
      expect(page).to_not have_content(2)
      expect(page).to_not have_content(7)

      expect(page).to have_content("The Hurler")
      expect(page).to have_content("The Scrambler")
      expect(page).to have_content("Jaws")
    end

    it 'And I only see rides that are open' do
      visit "/mechanics/#{@susan.id}"

      expect(page).to have_content("The Scrambler")
      expect(page).to_not have_content("Ferris Wheel")

      visit "/mechanics/#{@jimmy.id}"

      expect(page).to have_content("Jaws")
      expect(page).to_not have_content("Ferris Wheel")
    end

    it 'And the rides are listed by thrill rating in descending order (most thrills first)' do
      visit "/mechanics/#{@barry.id}"
      
      expect("The Hurler").to appear_before("Jaws")
      expect("Jaws").to appear_before("The Scrambler")

      expect("The Scrambler").to_not appear_before("The Hurler")
      expect("The Scrambler").to_not appear_before("Jaws")
    end
  end

  # Story 3 - Add a Ride to a Mechanic

  # As a user,
  # When I go to a mechanics show page
  # I see a form to add a ride to their workload
  # When I fill in that field with an id of an existing ride and hit submit
  # I’m taken back to that mechanic's show page
  # And I see the name of that newly added ride on this mechanics show page

  describe 'Story 3 - When I go to a mechanics show page' do
    before :each do
      @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
      @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

      @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
      @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

      @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
      @barry = Mechanic.create!(name: "Barry", years_experience: 5)
    end
    it 'I see a form to add a ride to their workload' do
      visit "/mechanics/#{@barry.id}"
      
      expect(page).to have_field("add_ride")
      expect(page).to have_button("Add Ride")
    end

    it 'when I fill out form I am taken back to machanic show page and see ride has been added' do
      visit "/mechanics/#{@barry.id}"

      expect(@barry.rides).to eq([])

      fill_in "add_ride", with: "#{@hurler.id}"
      click_on "Add Ride"

      expect(current_path).to eq("/mechanics/#{@barry.id}")
      
      expect(page).to have_content("The Hurler")

      fill_in "add_ride", with: "#{@jaws.id}"
      click_on "Add Ride"

      expect(page).to have_content("The Hurler")
      expect(page).to have_content("Jaws")
    end
  end
end