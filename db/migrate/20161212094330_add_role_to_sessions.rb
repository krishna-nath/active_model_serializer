class AddRoleToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :roles, :integer, default: 2
  end
end
