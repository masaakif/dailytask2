class AddVersionNumberToTasklistDemo < ActiveRecord::Migration
  def self.up
    add_column :tasklist_demos, :versionnumber, :integer
  end

  def self.down
    remove_column :tasklist_demos, :versionnumber
  end
end
