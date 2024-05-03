Rails.application.routes.draw do
  resources :boards, only: [:index, :show, :create] do
    resources :drawings, only: [:create]
  end
  root 'boards#index'
end
