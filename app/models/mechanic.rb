class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.average_years_experience
    average(:years_experience)
  end

  def rides_open
    rides.where(open: :true)
  end
end