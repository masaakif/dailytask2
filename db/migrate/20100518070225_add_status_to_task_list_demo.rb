class AddStatusToTaskListDemo < ActiveRecord::Migration
  def self.up
    add_column :tasklist_demos, :status, :string
  end

  def self.down
    remove_column :tasklist_demos, :status
  end
end
