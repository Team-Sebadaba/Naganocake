class RenamePasswordColumnToAdmins < ActiveRecord::Migration[6.1]
  def change
    rename_column :admins, :password, :encrypted_password
  end
end
