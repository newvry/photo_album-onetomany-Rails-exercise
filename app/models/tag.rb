class Tag < ApplicationRecord

	has_many :album_tagships
	has_many :album, through: :album_tagships

end