class PostsController < ApplicationController
	before_action :require_user

	def index
		@posts = current_user.posts
	end

	def new
		@post = current_user.posts.new
		
	end

	def create
		@post = current_user.posts.new(post_params)
		@post.save
		redirect_to posts_path
	end

	private 
	def post_params
	  params.require(:post).permit(:content)
	end

end
