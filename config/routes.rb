Rails.application.routes.draw do

	
  devise_for :users
	resources :albums do
		collection do
			get :latest
			
		end	

		resources :photos, :controller => "album_photos" do
			post :bulk_update, on: :collection
		
			get :dashboard, on: :member
		end

		
	end

	resources :photos
	root to: "albums#index"
end
