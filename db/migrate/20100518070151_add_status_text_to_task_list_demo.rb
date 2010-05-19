class AddStatusTextToTaskListDemo < ActiveRecord::Migration
  def self.up
    add_column :tasklist_demos, :statustext, :string
  end

  def self.down
    remove_column :tasklist_demos, :statustext
  end
end
