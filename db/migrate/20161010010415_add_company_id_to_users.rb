class AddCompanyIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :companyid, :integer
  end
end
