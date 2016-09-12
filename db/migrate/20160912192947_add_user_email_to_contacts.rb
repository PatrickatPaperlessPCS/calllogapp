class AddUserEmailToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :user_email, :string
  end
end
