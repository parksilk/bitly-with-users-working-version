class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string  :url
      t.string  :key
      t.integer :click_count
      t.integer :user_id
      t.timestamps
    end
  end
end
