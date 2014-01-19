class ApplicationController < ActionController::Base
  before_filter :set_charset
  protect_from_forgery
  helper_method :resource, :resource_name, :devise_mapping

  def resource_name
    :member
  end

  def resource
    @resource ||= Member.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:member]
  end

private
    def set_charset
      headers['Content-Type'] = "text/html; charset=utf-8"
    end
end
