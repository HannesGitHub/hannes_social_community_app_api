class Api::V1::BaseApiController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  HELPER = {
      missing_param: 'missing_param'
  }
  before_action :restrict_access, except: [:login_auth, :signup]
  def login_auth
    user = User.find_by(username: params[:username])
    render json: {status: 'SUCCESS', message: 'User logged in', data: user}, status: :ok and return if user.authenticate(params[:password])
    render json: {status: 'ERROR', message: 'User not logged in', data: user.errors}, status: :unprocessable_entity
  end

  def signup
    user = User.new(user_params)
    render json: {status: 'SUCCESS', message: 'User saved', data: user}, status: :ok and return if user.save
    render json: {status: 'ERROR', message: 'User not saved', data: user.errors}, status: :unprocessable_entity
  end

  def render_success(message, data)
    render json: {status: 'SUCCESS', message: message, data: data}, status: :ok
  end

  def render_bad_request(message)
    render json: {status: 'ERROR', message: message}, status: :bad_request
  end

  def render_unprocessable(message, data)
    render json: {status: 'ERROR', message: message, data: data}, status: :unprocessable_entity
  end

  def generate_message(type, value)
    "Parameter #{value} missing." if type == 'missing_param'
    "Unable to register #{value}." if type == 'failed'
  end

  # Sample for usage
  #   validate('my_parameter', 'my_second_parameter', params)
  #     -> if my_paramter is missing from params the yield will be "my_parameter" which can be used in the message generator class.

  def validate(*params, access)
    params.map{|p| return p.flatten if access[p.to_sym].nil?}.join('')
  end

  private
  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      @user = User.find_by(auth_token: token)
      @user.present?
    end
  end

  def post_params
    params.require(:post).permit(:title, :message, :user_id)
  end

  def user_params
    params.require(:user).permit(:name, :surname, :username, :password)
  end
end