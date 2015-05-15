class AddNewColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fullname, :string
    add_column :users, :nickname, :string
    add_column :users, :avatar, :string, :default => "default_normal_user_avatar.png"
    add_column :users, :status, :integer, :default => 1
    add_column :users, :role, :string, :default => "borrower"

  end
end
