class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :parks, :admission_price, :integer
  end
end
