Rails.application.routes.draw do

  root 'shelters#index'
  
  resources :shelters do
    resources :clients
    resources :animals do
    	get 'adopt' => "animals#adopt"
     	put 'complete_adoption' => "animals#complete_adoption"
    end
end
    resources :clients do
		resources :animals do
		get 'donate' => "animals#donate"
		put 'complete_donation' => "animals#complete_donation"
	end
  end
  
  resources :animals
end