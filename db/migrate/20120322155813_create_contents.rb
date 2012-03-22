class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string "title", :default => ""
      t.string "link"
      t.timestamps
    end
  end
end
