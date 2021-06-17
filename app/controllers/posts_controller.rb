class PostsController < ApplicationController
  def index
  	@posts = Post.all.order(created_at: :desc)
  end

 #create new post 
  def new
  	@post = Post.new
  end

#create new post fucntion to add the data into the database 
  def create
	  @post = Post.new(title: params[:post][:title], content: params[:post][:content])
	  if @post.save
	    flash[:notice] = 'Successfully created a new post!'
	    redirect_to root_path
	  else
	    flash[:alert] = 'Something went wrong...'
	    render :new
	  end
  end

  def show
  	@post = Post.where(id: params[:id]).first
  	if !@post
      redirect_to root_path
    else
      @post.update(views: @post.views+1)
    end

  end

  #next funtion
  def edit
	  @post = Post.where(id: params[:id]).first
	  if !@post
	    redirect_to root_path
	  end
  end
#end of edit
#update
def update
	  @post = Post.where(id: params[:id]).first
	  if !@post
	    redirect_to root_path
	  else
	    if @post.update(title: params[:post][:title], content: params[:post][:content])
	      flash[:notice] = 'Successfully updated the post!'
	      redirect_to show_post_path(id: @post.id)
	    else
	      flash[:alert] = 'Couldn’t update the post...'
	      render :edit
	    end
	  end
end
#end of update
def destroy
  @post = Post.where(id: params[:id]).first
  if !@post
    redirect_to root_path
  else
    if @post.destroy
      flash[:notice] = 'Successfully deleted the post!'
      redirect_to root_path
    else
      flash[:alert] = 'Couldn’t delete the post...'
      redirect_to show_post_path(id: @post.id)
    end
  end
end
#destroy end
end
