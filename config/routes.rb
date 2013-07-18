Trivia::Application.routes.draw do

  get "pages/index"
  get "games/pickquestion"

  resources :user_answers, :only => [:create, :index] do
    collection do
      get :clear
    end
  end
  resources :answers
  resources :questions
  resources :sessions, :only => [:new, :create, :destroy]

  root :to => 'sessions#new'
  
end
