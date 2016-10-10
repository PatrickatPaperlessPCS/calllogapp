class AddCompanyIdToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :companyid, :integer
  end
end
