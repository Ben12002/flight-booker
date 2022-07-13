class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :passengers, :username, :name
  end
end
