class AddNombreToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :nombre, :string
  end
end
