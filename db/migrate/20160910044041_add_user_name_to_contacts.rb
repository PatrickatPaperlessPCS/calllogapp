class AddUserNameToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :user_name, :string
  end
end
