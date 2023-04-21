class ChangePriceToBeIntegerInSubscriptions < ActiveRecord::Migration[6.0]
  def change
    change_column :subscriptions, :price, :integer, using: 'price::integer'
  end
end
