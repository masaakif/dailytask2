class AddClientIpToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :client_ip, :string
  end

  def self.down
    remove_column :users, :client_ip
  end
end
