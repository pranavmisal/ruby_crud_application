class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@posts = Post.find(params[:id])
	end

	def new
		@posts = Post.new
	end

	def create
		#byebug
		@posts = Post.new(posts_params)

		if @posts.save
			redirect_to posts_path, :notice => "Your post was saved"
		else
			render "new"
		end
	end

	def edit
		@posts = Post.find(params[:id])
	end

	def update
		@posts = Post.find(params[:id])

		#if @posts.update_attributes(params[:post])     
		if @posts.update_attributes(params[:post].permit(:title,:content))
			redirect_to posts_path, :notice => "Your post has been updated"
		else
			render "edit"
		end
	end

	def destroy
		@posts = Post.find(params[:id])
		@posts.destroy
		redirect_to posts_path, :notice => "Your post has been deleted"
	end
end

private
  def posts_params
  	#byebug
    params.require(:post).permit(:id, :title, :content)
  end


