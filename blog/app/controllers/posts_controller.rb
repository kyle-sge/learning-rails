class PostsController < BasicController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(request['id'])
  end
end