class AddHostIdToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :host_id, :integer
  end
end
