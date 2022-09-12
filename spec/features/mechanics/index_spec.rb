require 'rails_helper'

RSpec.describe 'mechanics index page' do
  # Story 1 - Mechanic Index Page

  # As a user,
  # When I visit the mechanics index page
  # I see a header saying “All Mechanics”
  # And I see a list of all mechanic’s names and their years of experience
  # And I see the average years of experience across all mechanics
  
  describe 'Story 1 - When I visit the mechanics index page' do
    
    it 'I see a header saying All Mechanics' do
      visit "/mechanics"
      expect(page).to have_content("All Mechanics")
    end 

  end
end