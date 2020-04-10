class Addlocationtobands < ActiveRecord::Migration[6.0]
  def change
    add_column :bands, :location, :string
  end
end
