class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :category
      t.string :api_id
      t.text :media_url
      t.string :title
      t.string :media_type
      t.text :description
      t.string :date_uploaded
      t.integer :library_id

      t.timestamps
    end
  end
end
