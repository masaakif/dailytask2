class CreateTasklistDemos < ActiveRecord::Migration
  def self.up
    create_table :tasklist_demos do |t|
      t.datetime :registered
      t.datetime :deadline
      t.string :description
      t.float :time_required
      t.string :assignee

      t.timestamps
    end
  end

  def self.down
    drop_table :tasklist_demos
  end
end
