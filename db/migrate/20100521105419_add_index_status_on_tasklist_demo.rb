class AddIndexStatusOnTasklistDemo < ActiveRecord::Migration
  def self.up
    add_index :tasklist_demos, :status
  end

  def self.down
    remove_index :tasklist_demos, :status
  end
end
