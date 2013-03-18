Routes = Router.new do
  match "/" => "home#index"
  match "/posts" => "posts#index"
end