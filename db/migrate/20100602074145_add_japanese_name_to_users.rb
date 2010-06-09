class AddJapaneseNameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :japanese_name, :string
  end

  def self.down
    remove_column :users, :japanese_name
  end
end
