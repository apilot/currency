class ApplicationController < ActionController::Base
  before_action :set_locale

  ### TimeZone

  def browser_time_zone
    browser_tz = ActiveSupport::TimeZone.find_tzinfo(cookies[:timezone])
    ActiveSupport::TimeZone.all.find { |zone| zone.tzinfo == browser_tz } || Time.zone
  rescue TZInfo::UnknownTimezone, TZInfo::InvalidTimezoneIdentifier
    Time.zone
  end

  helper_method :browser_time_zone

  def configure_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end

  ### i18n

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale] || cookies[:locale] || request.env["HTTP_ACCEPT_LANGUAGE"].scan(/^[a-z]{2}/)[0]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil

    cookies[:locale] = parsed_locale unless cookies[:locale] && cookies[:locale] == parsed_locale

    parsed_locale
  end
end
