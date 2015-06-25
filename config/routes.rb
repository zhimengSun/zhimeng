Rails.application.routes.draw do
  get "about_me" => 'zhis#about_me'
  
  get "tag/:tag", to: "blogs#tag", as: "tag"
  get "search", to: "zhis#search"

  resources :blogs
  resources :songs
  resources :image_descs

  root "zhis#index"
end
