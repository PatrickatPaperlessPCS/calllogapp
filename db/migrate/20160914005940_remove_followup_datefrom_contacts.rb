class RemoveFollowupDatefromContacts < ActiveRecord::Migration
  def up
   change_column :contacts, :followup_date, :datetime
   rename_column :contacts, :followup_date, :followup_at
  end

  def down
   change_column :contacts, :followup_at, :date
   rename_column :contacts, :followup_at, :followup_date
  end

end
