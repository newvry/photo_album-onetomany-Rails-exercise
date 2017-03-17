class CreateAlbumTagships < ActiveRecord::Migration[5.0]
  def change
    create_table :album_tagships do |t|

      t.integer :album_id
      t.integer :tag_id 	

      t.timestamps
    end
  end
end
