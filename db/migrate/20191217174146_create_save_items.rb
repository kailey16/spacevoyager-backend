class CreateSaveItems < ActiveRecord::Migration[6.0]
  def change
    create_table :save_items do |t|
      t.integer :library_id
      t.integer :item_id

      t.timestamps
    end
  end
end
