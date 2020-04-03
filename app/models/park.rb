class Park < ApplicationRecord
  validates_presence_of :name, :admission_price
  has_many :rides


  def average_thrill_rating
    average = rides.average(:thrill_rating)
    average.round(1)
  end

end
