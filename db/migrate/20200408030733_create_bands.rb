class CreateBands < ActiveRecord::Migration[6.0]
  def change
    create_table :bands do |t|
      t.string :name 
      t.text :bio

      t.timestamps
    end
  end
end
