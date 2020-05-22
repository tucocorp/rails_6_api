class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  # return auth token once user is authenticated
  api :POST, "/api/v1/auth/login", "Authentification login"
  param :email, String, desc: 'User email'
  param :password, String, desc: 'User password'
  def authenticate
    auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(auth_token: auth_token)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
