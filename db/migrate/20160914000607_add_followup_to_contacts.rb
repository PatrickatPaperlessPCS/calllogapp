class AddFollowupToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :followup_date, :date
  end
end
