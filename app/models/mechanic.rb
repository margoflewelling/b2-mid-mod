class Mechanic < ApplicationRecord
  validates_presence_of :name, :years_experience
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def add_ride(ride_id)
    ride = Ride.find(ride_id)
    rides << ride
  end

end
