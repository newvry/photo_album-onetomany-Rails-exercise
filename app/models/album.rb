class Album < ApplicationRecord

	has_many :photos
	has_many :album_tagships
	has_many :tag, through: :album_tagships

	belongs_to :category
	belongs_to :user

end
