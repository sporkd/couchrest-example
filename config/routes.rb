ActionController::Routing::Routes.draw do |map|
  map.resources :users, :has_one => :address
  map.root :controller => 'Users'
end
