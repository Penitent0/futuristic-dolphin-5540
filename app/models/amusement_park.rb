class AmusementPark < ApplicationRecord
  has_many :rides

  def rides_alpha
    rides.order(:name)
  end

  def average_ride_thrill
    rides.average(:thrill_rating)
  end
end