class AlterUser < ActiveRecord::Migration
  def up
    add_column("users", "content_id", :integer)
  end

  def down
    remove_column("users", "content_id")
  end
end
