Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'

  resources:posts do
    resources:comments do
      get 'like', to: 'comments#like', as: 'like'
      get 'dislike', to: 'comments#dislike', as: 'dislike'
    end
    get 'like', to: 'posts#like', as: 'like'
    get 'dislike', to: 'posts#dislike', as: 'dislike'
  end

  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }
end
