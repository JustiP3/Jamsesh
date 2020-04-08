class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.datetime :date 
      t.text :content
      t.integer :band_id 
      t.integer :author_id

      t.timestamps
    end
  end
end
