Rails.application.routes.draw do
  post 'users/:email/add_entry/:entry_id', to: 'users#add_entry'
  delete 'users/:email/remove_entry/:entry_id', to:'users#remove_entry'

  post '/tags/:title/add_to_entry/:entry_id', to: 'tags#add_to_entry'
  delete '/tags/:title/remove_from_entry/:entry_id', to: 'tags#remove_from_entry'
  
	resources :entries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
