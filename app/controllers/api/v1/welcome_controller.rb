class Api::V1::WelcomeController < ApplicationController
  skip_before_action :authorize_request, only: :status

  api :GET, "/ap1/v1/", "Status Api"
  def status
    response = I18n.t('config.api.v1.status.ok')
    json_response(response, :ok)
  end
end
