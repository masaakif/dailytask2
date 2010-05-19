class ChangeStatusTextTypeToTextForTasklistDemo < ActiveRecord::Migration
  def self.up
    change_column :tasklist_demos, :statustext, :text
  end

  def self.down
    change_column :tasklist_demos, :statustext, :string
  end
end
