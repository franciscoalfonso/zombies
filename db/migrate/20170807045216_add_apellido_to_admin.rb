class AddApellidoToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :apellido, :string
  end
end
