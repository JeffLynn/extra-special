class CreateUser < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :limit => 50, :null => false
      t.string :account, :limit => 20, :null => false
      t.string :email, :limit => 100, :null => false
      t.string :hashed_password, :limit => 50, :null => false
      t.string :salt, :limit => 50, :null => false
      t.timestamps
    end

    add_index :users, :account, :unique => true

  end

  def self.down
    drop_table :users
  end
end
