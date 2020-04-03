class AddAdmissionPriceToParks < ActiveRecord::Migration[5.1]
  def change
    add_column :parks, :admission_price, :integer
  end
end
