class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :name, index: true
      t.string :name_en, index: true
      t.text :text, index: true
      t.timestamps
      t.datetime :deleted_at, index: true
    end
    add_index :topics, :updated_at
  end
end
