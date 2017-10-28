class Api::V1::UsersController < Api::V1::BaseApiController

  def index
    users = User.active
    render_success('Loaded users', users)
  end

  def show
    user = User.find(params[:id])
    render_success('User found', user)
  end

  def create
    user = User.new(user_params)
    render_success('User saved', user) and return if user.save
    render_unprocessable('User not saved', user.errors)
  end

  def update
    user = User.find(params[:id])
    render_success('User updated', user) and return if user.update_attributes(user_params)
    render_unprocessable('User not updated', user.errors)
  end

  def destroy
    user = User.find(params[:id])
    user.is_active = false
    render_success('User deleted', user) and return if user.save
    render_unprocessable('User not deleted', user)
  end

  def news_feed
    render_success('newsfeed', @user.following.map{|following| following.user.posts.map{|posts| posts.attributes}}.flatten.sort_by!{|hash| hash[:created_at]})
  end

  def followers
    render_success('followers', @user.followers.as_json(:include => { :user => {}}))
  end

  def following
    render_success('following', @user.following.as_json(:include => { :follower => {}}))
  end

  def follow
    missing_param = validate('user_id', params)
    render_bad_request(generate_message('missing_param', missing_param)) and return if missing_param.present?

    user_follower =  UserFollower.find_by(user_id: @user.id, follower_id: params[:user_id])
    user_follower.destroy

    user_follower =  UserFollower.new(user_id: @user.id, follower_id: params[:user_id])
    if user_follower.valid?
      user_follower.save
      render_success('Follow registered', nil) and return
    else
      render_bad_request(generate_message('failed', 'follow')) and return
    end
  end

  def unfollow
    missing_param = validate('user_id', params)
    render_bad_request(generate_message('missing_param', missing_param)) if missing_param

    begin
      user_follower =  UserFollower.find_by(user_id: @user.id, follower_id: params[:user_id])
      user_follower.destroy
      render_success('Unfollow successful', nil)
    rescue
      render_bad_request(generate_message('failed', 'unfollow'))
    end

  end

end