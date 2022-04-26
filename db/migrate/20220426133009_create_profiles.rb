class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :first_name 
      t.string :last_name
      t.datetime :birth_day
      t.text :self_describe
      t.integer :user_id

      t.timestamps
    end
  end
end
