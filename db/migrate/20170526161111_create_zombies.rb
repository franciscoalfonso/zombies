class CreateZombies < ActiveRecord::Migration[5.1]
  def change
    create_table :zombies do |t|
      t.string :name
      t.text :bio
      t.integer :age
      t.string :email
      t.boolean :rooten

      t.timestamps
    end
  end
end
