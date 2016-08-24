class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :contacttype
      t.string :company
      t.string :department
      t.string :person
      t.decimal :duration
      t.text :notes

      t.timestamps null: false
    end
  end
end
