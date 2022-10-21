class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      
      t.integer :genre_id
      t.string  :item_name
      t.text    :item_introduction
      t.boolean :is_active, default: "TRUE"
      t.integer :non_taxed
      
      t.timestamps
    end
  end
end
