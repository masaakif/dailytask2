class AddClientIpToTasklistDemo < ActiveRecord::Migration
  def self.up
    add_column :tasklist_demos, :clientIP, :string
  end

  def self.down
    remove_column :tasklist_demos, :clientIP
  end
end
