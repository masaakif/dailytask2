class RemoveClientIpFromTasklistDemo < ActiveRecord::Migration
  def self.up
    remove_column :tasklist_demos, :clientIP
  end

  def self.down
    add_column :tasklist_demos, :clientIP, :string
  end
end
