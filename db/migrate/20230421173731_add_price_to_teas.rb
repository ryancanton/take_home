class AddPriceToTeas < ActiveRecord::Migration[6.0]
  def change
    add_column :teas, :price, :integer
  end
end
