class Ride < ApplicationRecord
  validates_presence_of :name, :thrill_rating
  belongs_to :park
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

end
