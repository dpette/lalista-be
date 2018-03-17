class CreateCoverImages < ActiveRecord::Migration[5.1]
  def change
    create_table :cover_images do |t|
      t.string :url

      t.timestamps
    end
  end
end
