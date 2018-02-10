class UpdateColumnValueInWordOnWord < ActiveRecord::Migration[5.1]
  def change
    rename_column :words, :value, :name
  end
end
