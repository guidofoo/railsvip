# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '07c4c39e916ec2c64060b663e50ae0fb'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

  before_filter :set_locale
  def set_locale
    # if params[:locale] is nil then I18n.default_locale will be used
    if params[:site_id] != nil
      locale = Site.first(:conditions => ["site_id = ?", params[:site_id]]).locale
    else
      locale = params[:locale]
    end
    I18n.locale = locale
  end

  after_filter :set_charset

  def set_charset
    content_type = headers["Content-Type"] || 'text/html'
    if /^text\//.match(content_type)
      headers["Content-Type"] = "#{content_type}; charset=ISO-8859-1" 
    end
  end
  
end
