class AddColumnArchivedAtToPersonAndWord < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :archived_at, :datetime    
    add_column :words, :archived_at, :datetime    
  end
end
