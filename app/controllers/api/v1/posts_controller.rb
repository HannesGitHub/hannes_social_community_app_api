class Api::V1::PostsController < Api::V1::BaseApiController

  def index
    posts = Post.active
    render_success('Loaded posts', posts)
  end

  def show
    post = Post.find(params[:id])
    render_success('Post found', post)
  end

  def create
    post = Post.new(post_params)
    post.user_id = @user.id
    render_success('Post saved', post) and return if post.save
    render_unprocessable('Post not saved', post.errors)
  end

  def update
    post = Post.find(params[:id])
    render_success('Post updated', post) and return if post.update_attributes(post_params)
    render_unprocessable('Post not updated', post.errors)
  end

  def destroy
    post = Post.find(params[:id])
    post.is_active = false
    render_success('Post deleted', date: post) and return if post.save
    render_unprocessable('Post not deleted', post)
  end

end