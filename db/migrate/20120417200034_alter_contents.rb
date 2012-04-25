class AlterContents < ActiveRecord::Migration
  def up
    add_column("contents", "user_id", :integer)
    add_column("contents", "category_id", :integer)
  end

  def down
    remove_column "contents", "user_id"
    remove_column "contents", "category_id"
  end
end
