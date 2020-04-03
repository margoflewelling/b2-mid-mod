class Ride < ApplicationRecord
  validates_presence_of :name, :thrill_rating
  belongs_to :park
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  validates_inclusion_of :thrill_rating,
  in: [1,2,3,4,5,6,7,8,9,10]

end
