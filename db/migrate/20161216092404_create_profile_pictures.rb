class CreateProfilePictures < ActiveRecord::Migration
  def change
    create_table :profile_pictures do |t|
      t.references :user
      t.attachment :photo
    end
  end
end
