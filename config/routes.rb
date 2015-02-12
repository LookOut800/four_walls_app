Rails.application.routes.draw do
  resources :posts do
    resources :comments, shallow: true
    resources :categories, except: [:index, :create, :show, :new, :edit]
  end
  resources :categories, except: [:update, :destroy]
  root 'posts#index'
  resources :credits, only: [:index]
end


#           Prefix Verb   URI Pattern                              Controller#Action
#    post_comments GET    /posts/:post_id/comments(.:format)       comments#index
#                  POST   /posts/:post_id/comments(.:format)       comments#create
# new_post_comment GET    /posts/:post_id/comments/new(.:format)   comments#new
#     edit_comment GET    /comments/:id/edit(.:format)             comments#edit
#          comment GET    /comments/:id(.:format)                  comments#show
#                  PATCH  /comments/:id(.:format)                  comments#update
#                  PUT    /comments/:id(.:format)                  comments#update
#                  DELETE /comments/:id(.:format)                  comments#destroy
#    post_category PATCH  /posts/:post_id/categories/:id(.:format) categories#update
#                  PUT    /posts/:post_id/categories/:id(.:format) categories#update
#                  DELETE /posts/:post_id/categories/:id(.:format) categories#destroy
#            posts GET    /posts(.:format)                         posts#index
#                  POST   /posts(.:format)                         posts#create
#         new_post GET    /posts/new(.:format)                     posts#new
#        edit_post GET    /posts/:id/edit(.:format)                posts#edit
#             post GET    /posts/:id(.:format)                     posts#show
#                  PATCH  /posts/:id(.:format)                     posts#update
#                  PUT    /posts/:id(.:format)                     posts#update
#                  DELETE /posts/:id(.:format)                     posts#destroy
#             root GET    /                                        posts#index
# ~/wdi/rails_apps/four_walls_app (master)$
