class AddCreatedByAndUpdatedByToTasklistDemos < ActiveRecord::Migration
  def self.up
    add_column :tasklist_demos, :created_by, :string
    add_column :tasklist_demos, :updated_by, :string
  end

  def self.down
    remove_column :tasklist_demos, :updated_by
    remove_column :tasklist_demos, :created_by
  end
end
