class CreatePoints < ActiveRecord::Migration[5.1]
  def change
    create_table :points do |t|
      t.integer :word_id
      t.integer :person_id

      t.timestamps
    end
  end
end
