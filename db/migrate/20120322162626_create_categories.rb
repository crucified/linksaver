class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string "category_name", :limit => 40
      t.timestamps
    end
  end
end
