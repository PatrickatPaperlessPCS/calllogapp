class FixColumnNameInAdmins < ActiveRecord::Migration
  def change
  	rename_column :admins, :companyid, :host_id
  end
end
