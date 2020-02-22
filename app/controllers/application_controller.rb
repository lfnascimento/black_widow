class ApplicationController < ActionController::API
  include Knock::Authenticable
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
    render json: I18n.t('errors.messages.not_found'), status: 404
  end
end
