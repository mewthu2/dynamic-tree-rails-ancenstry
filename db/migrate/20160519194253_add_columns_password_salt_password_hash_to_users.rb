class AddColumnsPasswordSaltPasswordHashToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :password_hash, :string,   null: false
    add_column :users, :password_salt, :string,   null: false
  end

  def self.down
    drop_column :users, :password_hash
    drop_column :users, :password_salt
  end
end
