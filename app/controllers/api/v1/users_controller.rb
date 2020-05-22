class Api::V1::UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  api :POST, "/api/v1/signup", "return authenticated token upon signup"
  param :name, String, desc: 'User name'
  param :last_name, String, desc: 'User last name'
  param :email, String, desc: 'User email'
  param :password, String, desc: 'User password'
  param :password_confirmation, String, desc: 'User confirmation of password'
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  private

  def user_params
    params.permit(
      :name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
