class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :subscriptions, :status, :active
  end
end
