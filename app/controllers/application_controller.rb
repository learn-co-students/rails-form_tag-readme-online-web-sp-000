class ApplicationController < ActionController::Base
    
  protect_from_forgery with: :exception
  
    def create
    Post.create(title: params[:post][:title], description: params[:post][:description])
    redirect_to posts_path
    end

end
