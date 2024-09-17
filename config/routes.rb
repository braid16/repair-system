Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    root 'repairs#index' # 管理员首页显示所有报修
    resources :repairs # 管理员可以进行所有操作
  end
  
  # 根据DSL定义应用程序路由 https://guides.rubyonrails.org/routing.html

  # 在/up路径上显示健康状态，如果应用程序启动时没有异常则返回200，否则返回500。
  # 可以被负载均衡器和正常运行时间监控器用来验证应用程序是否正常运行。
  get "up" => "rails/health#show", as: :rails_health_check

  # 从app/views/pwa/*渲染动态PWA文件
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # 定义根路径路由("/")
  # root "posts#index"

   # 将报修表单页面设为首页
  resources :repairs # 只允许新建和创建操作

  root 'home#index'
end
