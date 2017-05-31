class AddZombieToBrain < ActiveRecord::Migration[5.1]
  def change
    add_reference :brains, :zombie, foreign_key: true
  end
end
