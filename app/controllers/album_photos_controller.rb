class AlbumPhotosController < ApplicationController

	before_action :album_find

	before_action :photo_find, only: [:show, :edit, :update, :destroy]

	def index
		#@album = Album.find(params[:album_id]) #album id
		@photos = @album.photos
	end

	def new
		#@album = Album.find(params[:album_id])
		@photo = Photo.new
	end

	def create
		#@album = Album.find(params[:album_id])
		@photo = @album.photos.new(photo_params)
		if @photo.save
			redirect_to album_photos_path
		else	
			render :new
		end
	end

	def show
		#@album = Album.find(params[:album_id])
		#@photo = @album.photos.find(params[:id])
	end

	def edit
		#@album = Album.find(params[:album_id])
		#@photo = @album.photos.find(params[:id])
	end

	def update
		#@album = Album.find(params[:album_id])
		#@photo = @album.photos.find(params[:id])
		if @photo.update(photo_params)
			redirect_to album_photo_path
		else
			render :edit
		end
	end

	def destroy
		#@album = Album.find(params[:album_id])
		#@photo = @album.photos.find(params[:id])
		@photo.destroy

		redirect_to album_photos_path
	end


	private

	def album_find
		@album = Album.find(params[:album_id])
	end

	def photo_find
		@photo = @album.photos.find(params[:id])
	end

	def photo_params
		params.require(:photo).permit(:title, :date, :description, :file_location)
	end

end
