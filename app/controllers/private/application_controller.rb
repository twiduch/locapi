class Private::ApplicationController < ApplicationController
  before_action :authorize
  
  def authorize
    render(json: {error: 'Not Authorized'}, status: 401) unless token_verified?
  end
  
  def token_verified?
    params[:token] == Rails.application.secrets.api_token
  end
end
