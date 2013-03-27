class PostsController < BasicController
  def index
    # create an instance variable containing posts
    @posts = Post.all
  end

  def show
    # create an instance variable with the post id specified in the request
    @post = Post.find(request['id'])
  end
end