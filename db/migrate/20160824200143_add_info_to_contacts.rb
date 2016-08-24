class AddInfoToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :email, :boolean
    add_column :contacts, :eventdate, :date
  end
end
