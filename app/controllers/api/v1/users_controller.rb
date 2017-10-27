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

end