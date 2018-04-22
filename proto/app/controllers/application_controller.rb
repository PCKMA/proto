class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    home_index_path
  end

#  def current_member
#    @current_member ||= Member.find_by(id: session[:member_id])
#  end

  private
    def set_locale
      I18n.locale = locale_in_params || locale_in_accept_language || I18n.default_locale
    end

    def locale_in_params
      # params の locale の値（優先すべき）
      # @ return [Symbol]
      #   params から取った locale
      #   有効な値でなければ :en
      #   取得できなかった場合 nil
      if params[:locale].present?
        params[:locale].to_sym.presence_in(I18n::available_locales) || I18n.default_locale
      else
        nil
      end
    end

    def locale_in_accept_language
      # 環境変数 HTTP_ACCEPT_LANGUAGE を順に検証し、最初に一致した有効な locale を返す
      # @ return [Symbol]  環境変数 HTTP_ACCEPT_LANGUAGE から取った locale 。取得できなかった場合 nil
      request.env['HTTP_ACCEPT_LANGUAGE']
      .to_s #nil対策
      .split(',')
      .map { |_| _[0..1].to_sym}
      .select { |_| I18n::available_locales.include?(_)}
      .first
    end

    def default_url_options(options = {})
      # 全リンクに locale 情報をセットする
      # @ return [Hash] locale をキーとするハッシュ
            { locale: I18n.locale }
    end

    def sign_in_required
      redirect_to new_member_session_url unless member_signed_in?
    end

end
