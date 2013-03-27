Routes = Router.new do
  # home controller index
  match "/" => "home#index"
  # posts controller index
  match "/posts" => "posts#index"
  # posts controller show
  match "/posts/show" => "posts#show"
end