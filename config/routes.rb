Rails.application.routes.draw do
  # get 'summaries/index'

  # get 'summaries/new'

  # get 'summaries/show'

  # get 'summaries/edit'

  get 'topics/index'

  get 'topics/new'

  get 'topics/show'

  get 'topics/edit'

  devise_for :users
  resources :users, only: [:update]
    resources :summaries
  resources :topics do
    resources :posts, except:[:index]
      resources :comments, only: [:create]



  end

  get 'about' => 'welcome#about'

root to: 'welcome#index'  
end
