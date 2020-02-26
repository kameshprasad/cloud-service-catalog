Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/service/:service_code/region/:region", to: 'services#index'
end
