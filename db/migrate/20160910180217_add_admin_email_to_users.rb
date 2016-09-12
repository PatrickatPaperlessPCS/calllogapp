class AddAdminEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin_email, :string
  end
end
