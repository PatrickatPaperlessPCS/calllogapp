class FixColumnNameInUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :companyid, :host_id
  end
end
