class SessionStore < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :session_key
      t.references :user, index: true
      t.timestamps
    end

  end
end
