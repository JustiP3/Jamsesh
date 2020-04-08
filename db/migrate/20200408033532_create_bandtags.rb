class CreateBandtags < ActiveRecord::Migration[6.0]
  def change
    create_table :bandtags do |t|
      t.integer :band_id
      t.integer :tag_id     

      t.timestamps
    end
  end
end
