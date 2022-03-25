module Authenticable 
  private

  def authenticate_with_token
    @token ||= request.headers['Authorization']

    render(json:{errors: "Forneça um header authorization para se identificar."},
            status: :unathorized) unless valid_token?
  end

  def valid_token?
    @token.present? && @token.size >= 10
  end
end