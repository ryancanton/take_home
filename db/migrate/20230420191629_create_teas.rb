class CreateTeas < ActiveRecord::Migration[6.0]
  def change
    create_table :teas do |t|
      t.string :title
      t.string :description
      t.integer :temp
      t.integer :brew_time
      t.integer :price

      t.timestamps
    end
  end
end
