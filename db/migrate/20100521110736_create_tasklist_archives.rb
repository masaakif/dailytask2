class CreateTasklistArchives < ActiveRecord::Migration
  def self.up
    create_table :tasklist_archives do |t|
      t.integer :tasklist_demo_id
      t.datetime :registered
      t.datetime :deadline
      t.float :time_required
      t.string :assignee
      t.datetime :original_created_at
      t.datetime :original_updated_at
      t.text :statustext
      t.string :status
      t.integer :versionnumber
      t.text :description
      t.string :created_by
      t.string :updated_by
      t.datetime :created_at

      t.timestamps
    end
  end

  def self.down
    drop_table :tasklist_archives
  end
end
