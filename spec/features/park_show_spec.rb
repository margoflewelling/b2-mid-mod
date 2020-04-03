require 'rails_helper'

RSpec.describe "Parks a user", type: :feature do
  before(:each) do
    @mechanic_1 = Mechanic.create(name: "Frank",
                                  years_experience: "12")
    @mechanic_2 = Mechanic.create(name: "Jane",
                                  years_experience: "5")
    @mechanic_3 = Mechanic.create(name: "Bob",
                                  years_experience: "2")

    @park_1 = Park.create(name: "Disney",
                          admission_price: "50")
    @park_2 = Park.create(name: "Harry Potter",
                          admission_price: "70")

    @ride_1 = @park_1.rides.create(name: "Upside Down",
                          thrill_rating: 7)
    @ride_2 = @park_1.rides.create(name: "Tea Cups",
                          thrill_rating: 3)
    @ride_3 = @park_2.rides.create(name: "Hedwigs flight",
                          thrill_rating: 8)

  end

  it "can see a parks show page" do
    visit "/parks/#{@park_1.id}"
    expect(page).to have_content(@park_1.name)
    expect(page).to have_content("Admissions: $#{@park_1.admission_price}")
    within("#rides") do
      expect(page).to have_content(@ride_1.name)
      expect(page).to have_content(@ride_2.name)
      expect(page).to_not have_content(@ride_3.name)
    end
    expect(page).to have_content("Average Thrill Rating of Rides: 5.0/10")
    save_and_open_page
    end
end
