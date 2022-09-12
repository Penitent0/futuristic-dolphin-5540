require 'rails_helper'

RSpec.describe 'mechanics index page' do
  # Story 1 - Mechanic Index Page

  # As a user,
  # When I visit the mechanics index page
  # I see a header saying “All Mechanics”
  # And I see a list of all mechanic’s names and their years of experience
  # And I see the average years of experience across all mechanics
  
  describe 'Story 1 - When I visit the mechanics index page' do
    before :each do
      @barry = Mechanic.create!(name: "Barry", years_experience: 5)
      @susan = Mechanic.create!(name: "Susan", years_experience: 2)
      @molly = Mechanic.create!(name: "Molly", years_experience: 7)
      @jimmy = Mechanic.create!(name: "Jimmy", years_experience: 4)
    end
    it 'I see a header saying All Mechanics' do
      visit "/mechanics"
      expect(page).to have_content("All Mechanics")
    end 

    it 'And I see a list of all mechanics names and their years of experience' do
      visit "/mechanics"

      expect(page).to have_content("Name: Barry")
      expect(page).to have_content("Years: 5")
      expect(page).to have_content("Name: Susan")
      expect(page).to have_content("Years: 2")
      expect(page).to have_content("Name: Molly")
      expect(page).to have_content("Years: 7")
      expect(page).to have_content("Name: Jimmy")
      expect(page).to have_content("Years: 4")

    end

    it 'And I see the average years of experience across all mechanics' do
      
    end

  end
end