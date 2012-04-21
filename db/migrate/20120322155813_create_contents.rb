class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string "title", :default => ""
      t.string "link"
      t.datetime "created_at"
      t.timestamps
    end
  end
end
