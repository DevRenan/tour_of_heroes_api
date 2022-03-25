module Authenticable 
  private

  def authenticate_with_token
    @token ||= request.headers['Authorization']

    render(json:{errors: "Você não tem autorização para essa operação."},
            status: :unathorized) unless valid_token?
  end

  def valid_token?
    @token.present? && @token == Rails.application.credentials.token
  end
end