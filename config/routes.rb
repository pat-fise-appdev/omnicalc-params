Rails.application.routes.draw do
    match("flexible/square/:pat", {:controller => "calc", :action => "flexsquare", :via => "get"})
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
