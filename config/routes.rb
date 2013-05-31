if Rails::VERSION::MAJOR >= 3
  RedmineApp::Application.routes.draw do
    post '/projects/:project_id/carousels' => 'carousels#create', :as => 'project_carousels'
    get '/projects/:project_id/carousels/new' => 'carousels#new', :as => 'new_project_carousel'
    get '/projects/:project_id/carousels/:id/edit' => 'carousels#edit', :as => 'edit_project_carousel'
    put '/projects/:project_id/carousels/:id' => 'carousels#update', :as => 'project_carousel'
    delete '/projects/:project_id/carousels/:id' => 'carousels#destroy'
    #resources :projects do
      #resources :carousels, :except => [:index, :show]
    #end
  end
else
  ActionController::Routing::Routes.draw do |map|
    map.resources :carousels, :except => [:index, :show], :path_prefix => 'projects/:project_id', :name_prefix => 'project_'
  end
end
