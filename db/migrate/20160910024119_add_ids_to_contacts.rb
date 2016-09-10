class AddIdsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :admin_id, :integer
  end
end
