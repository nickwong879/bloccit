Rails.application.routes.draw do
  #get 'posts/index'

  #get 'posts/show'

  #get 'posts/new'

  #get 'posts/edit'

  resources  :posts
  
  #get 'welcome/index'

  #get 'welcome/about'

  #get 'welcome/contact'

  get 'about' => 'welcome#about'

root to: 'welcome#index'  
end
