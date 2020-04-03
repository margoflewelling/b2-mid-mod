class RemoveAdmissionPriceFromParks < ActiveRecord::Migration[5.1]
  def change
    remove_column :parks, :admission_price, :string
  end
end
