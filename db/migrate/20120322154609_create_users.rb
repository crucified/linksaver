class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string "email", :limit => 100
      t.string "hashed_password"
      t.string "salt"
      t.string "phone", :limit => 15
      t.timestamps
    end
  end

  def self.down
    drop_table(:users)
  end
end
