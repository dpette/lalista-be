class CreatePronounces < ActiveRecord::Migration[5.1]
  def change
    create_table :pronounces do |t|
      t.integer :person_id
      t.integer :word_id

      t.timestamps
    end
  end
end
