Rails.application.routes.draw do

	
	resources :albums do
		resources :photos, :controller => "album_photos"
	end

	resources :photos

end
