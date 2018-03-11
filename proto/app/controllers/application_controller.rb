class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    home_index_path
  end

  private
    def sign_in_required
      redirect_to new_member_session_url unless member_signed_in?
    end

end
