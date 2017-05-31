class CreateBrains < ActiveRecord::Migration[5.1]
  def change
    create_table :brains do |t|
      t.string :flavor
      t.integer :iq
      t.boolean :fresh

      t.timestamps
    end
  end
end
