class CreateWinners < ActiveRecord::Migration[5.1]
  def change
    create_table :winners do |t|
      t.integer :person_id

      t.timestamps
    end
    add_index :winners, :person_id
  end
end
