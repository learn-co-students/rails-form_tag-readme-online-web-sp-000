class PostsController < ApplicationController
  def index
    @posts = Post.all
    bob = 2
  end
  
end
