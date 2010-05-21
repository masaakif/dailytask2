class RemoveDescriptionFromTasklistDemo < ActiveRecord::Migration
  def self.up
    remove_column :tasklist_demos, :description
  end

  def self.down
    add_column :tasklist_demos, :description, :string
  end
end
