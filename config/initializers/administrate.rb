
Administrate::Engine.configure do |config|
   #  config.draw_routes = -> { root to: 'dashboard#index' }
  
  Rails.application.config.to_prepare do
    Administrate::Namespace.new(:admin) do |namespace|
      namespace.dashboard_class = Admin::Dashboard
      namespace.resource_class = Admin::Repair
    end
  end
end

  