Rails.application.routes.draw do
	resources :entries

  post '/users/:email/add_entry/:entry_id', to: 'users#add_entry', param: :email, constraints: { email: /.*/ }
  delete '/users/:email/remove_entry/:entry_id', to:'users#remove_entry', param: :email, constraints: { email: /.*/ }

	resources :tags, only: [:index, :show]
  post '/tags/:title/add_to_entry/:entry_id', to: 'tags#add_to_entry'
  delete '/tags/:title/remove_from_entry/:entry_id', to: 'tags#remove_from_entry'
  
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
