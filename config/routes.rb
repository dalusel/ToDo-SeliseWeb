Rails.application.routes.draw do
    get 'task_status/index'
    resources :task_status
    root :to=>'task_status#index'
    match 'task_status/index/status?:status' => 'task_status#index', via: :post
    match 'task_status/:id' => 'task_status#update', via: :post
end
