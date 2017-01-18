Rails.application.routes.draw do
  root 'quizzes#index'
  resources :poems, only: [:index]
  resources :quizzes
  post 'quiz', to: 'quizzes#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
