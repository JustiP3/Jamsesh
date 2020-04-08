class CreateUserbands < ActiveRecord::Migration[6.0]
  def change
    create_table :userbands do |t|
      t.integer :user_id
      t.integer :band_id 

      t.timestamps
    end 
  end
end
