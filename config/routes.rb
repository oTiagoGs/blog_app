Rails.application.routes.draw do
  namespace :admins_backoffice do
    get 'welcome/index'
  end
  namespace :site do
    get 'welcome/index'
  end

  root to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
