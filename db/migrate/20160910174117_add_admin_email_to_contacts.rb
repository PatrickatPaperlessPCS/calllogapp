class AddAdminEmailToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :admin_email, :string
  end
end
