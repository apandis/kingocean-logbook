class CreateVisitors < ActiveRecord::Migration[5.1]
  def change
    create_table :visitors do |t|
      t.string :name
      t.string :company
      t.string :purpose

      t.timestamps
    end
  end
end
