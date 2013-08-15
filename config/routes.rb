# JL 2013.07.03 Rewritten for Rails 3 syntax (and commented out default action on "stories" and moved "resources :applications" up - was mapping to "stories"?!)

ExtraSpecial::Application.routes.draw do
  
 resources :applications, controller: "apply", only: [:new, :create]
 
 namespace :admin do
    resources :stories
    #default '', controller: 'stories', action: 'index'
    resources :applications, only: [:index, :show, :destroy]
    resources :links
 end

  root :to            => "home#index"
    
  match "/contact_us"         =>   "home#contact_us", :as => :contact_us
  match "/about_us"           =>   "home#about_us", :as => :about_us
  match "/what_we_do"         =>   "home#what_we_do", :as => :what_we_do
  match "/stories"            =>   "home#stories", :as => :stories
  match "/how_you_can_help"   =>   "home#how_you_can_help", :as => :how_you_can_help
  match "/how_to_apply"       =>   "home#how_to_apply", :as => :how_to_apply
  match "/favourites"         =>   "home#favourites", :as => :favourites
  match "/:story_id"          =>   "home#stories", :as => :story
  

  
  
  match ':controller/:action/:id'
  match ':controller/:action/:id.:format'
 end
