Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users, controllers: { omniauth_callbacks: "user_sessions" }
  devise_scope :user do
    delete 'logout' => "devise/sessions#destroy", :as => :destroy_user_session
  end
  
  root to: 'welcome#index'
end
