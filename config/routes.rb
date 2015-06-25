Rails.application.routes.draw do
  get "about_me" => 'zhis#about_me'
  
  resources :blogs do
    collection do
      get :tag
    end
  end
  resources :songs
  resources :image_descs

  root "zhis#index"
end
