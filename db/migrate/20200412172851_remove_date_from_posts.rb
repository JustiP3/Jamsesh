class RemoveDateFromPosts < ActiveRecord::Migration[6.0]
  def change

    remove_column :posts, :date, :datetime
  end
end
