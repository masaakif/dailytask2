class ChangeDescriptionTextToDescriptionOnTasklistDemo < ActiveRecord::Migration
  def self.up
    rename_column :tasklist_demos, :descriptiontext, :description
  end

  def self.down
    rename_column :tasklist_demos, :description, :descriptiontext
  end
end
