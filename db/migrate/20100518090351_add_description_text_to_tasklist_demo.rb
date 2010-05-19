class AddDescriptionTextToTasklistDemo < ActiveRecord::Migration
  def self.up
    add_column :tasklist_demos, :descriptiontext, :text
  end

  def self.down
    remove_column :tasklist_demos, :descriptiontext
  end
end
