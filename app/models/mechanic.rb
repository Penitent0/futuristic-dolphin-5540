class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.average_years_experience
    average(:years_experience)
  end

  def rides_open_by_thrill_rating
    rides.where(open: :true).order(thrill_rating: :desc)
  end
end