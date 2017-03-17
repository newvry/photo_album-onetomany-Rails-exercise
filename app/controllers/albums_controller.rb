class AlbumsController < ApplicationController

	before_action :authenticate_user!, except: [:index]

	def index
		#@albums = Album.all
		if (params[:keyword])
			@albums = Album.where(["name LIKE ?", "%#{params[:keyword]}%"])
		else
			@albums = Album.all
		end

		if (params[:order])
			sort_by = (params[:order] == "name" ) ? "name" : "id"
			@albums = @albums.order(sort_by)
		end

	end

	def latest
		@album = Album.order("id DESC").limit(2)
	end



	def new
		@album = Album.new
	end

	def create
 		@album = Album.new(album_params)

 		@album.user = current_user

 		if @album.save
			redirect_to albums_url
		else	
			render :new
		end
	end

	# def show
	# 	@album = Album.find(params[:id])
	# end

	def edit
		@album = Album.find(params[:id])
	end

	def update
		@album = Album.find(params[:id])
		if @album.update(album_params)
			redirect_to albums_path
		else
			render :edit
		end
	end

	def destroy
		@album = Album.find(params[:id])
		@album.destroy

		redirect_to albums_path
	end


	private

	def album_params
		params.require(:album).permit(:name, :category_id, :tag_ids => [])
	end

end
