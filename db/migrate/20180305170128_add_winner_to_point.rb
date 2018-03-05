class AddWinnerToPoint < ActiveRecord::Migration[5.1]
  def change
    add_column :points, :winner_id, :integer
    add_index :points, :winner_id
  end
end
