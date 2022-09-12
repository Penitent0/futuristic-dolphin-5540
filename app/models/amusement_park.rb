class AmusementPark < ApplicationRecord
  has_many :rides

  def rides_alpha
    rides.order(:name)
  end

  def
end