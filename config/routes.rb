Rails.application.routes.draw do

  devise_for :admins

  namespace :admins_backoffice do
    get 'welcome/index' # Dashboard
    resources :admins # Administradores
    resources :subjects # Assuntos
    resources :articles # Artigos
  end
  namespace :site do
    get 'welcome/index'
    resources :articles, only: [:show]
    get 'subject/:subject_id/:subject', to: 'articles#subject', as: 'articles_subject'
  end

  root to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
