require 'rails_helper'

RSpec.describe "Mechanics A user", type: :feature do
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
    MechanicRide.create(ride_id: @ride_1.id, mechanic_id: @mechanic_1.id)
    MechanicRide.create(ride_id: @ride_3.id, mechanic_id: @mechanic_1.id)


  end

  it "can see list of all mechanics" do
    visit "/mechanics"
    expect(page).to have_content("All Mechanics")
    expect(page).to have_content("#{@mechanic_1.name} - #{@mechanic_1.years_experience} years of experience")
    expect(page).to have_content("#{@mechanic_2.name} - #{@mechanic_2.years_experience} years of experience")
    expect(page).to have_content("#{@mechanic_3.name} - #{@mechanic_3.years_experience} years of experience")
    end

    it "can go to a mechanics show page" do
      visit "/mechanics/#{@mechanic_1.id}"
      expect(page).to have_content("Mechanic: #{@mechanic_1.name}")
      expect(page).to_not have_content("Mechanic: #{@mechanic_2.name}")
      expect(page).to have_content("Years of Experience: #{@mechanic_1.years_experience}")
      expect(page).to have_content(@ride_1.name)
      expect(page).to have_content(@ride_3.name)
      expect(page).to_not have_content(@ride_2.name)

      fill_in('ride', :with => "#{@ride_2.id}")
      click_on('Submit')
      expect(page).to have_current_path("/mechanics/#{@mechanic_1.id}")
      expect(page).to have_content(@ride_2.name)
    end


  end
