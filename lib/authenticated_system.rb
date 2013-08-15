module AuthenticatedSystem
  protected
  # Returns true or false if the user is logged in.
  # Preloads @current_user with the user model if they're logged in.
  def logged_in?
    !!current_user
  end

  # Accesses the current user from the session.
  # Future calls avoid the database because nil is not equal to false.
  def current_user
    @current_user ||= login_from_auth_data unless @current_user == false
  end

  # Store the given user id in the session.
  def current_user=(new_user)
    @current_user = new_user || false
  end

  # Check if the user is authorized
  #
  # Override this method in your controllers if you want to restrict access
  # to only a few actions or if you want to check if the user
  # has the correct rights.
  #
  # Example:
  #
  #  # only allow nonbobs
  #  def authorized?
  #    current_user.login != "bob"
  #  end
  #
  def authorized?(action = action_name, resource = nil)
    logged_in?
  end

  # Filter method to enforce a login requirement.
  #
  # To require logins for all actions, use this in your controllers:
  #
  #   before_filter :login_required
  #
  # To require logins for specific actions, use this in your controllers:
  #
  #   before_filter :login_required, :only => [ :edit, :update ]
  #
  # To skip this in a subclassed controller:
  #
  #   skip_before_filter :login_required
  #
  def login_required
    authorized? || access_denied
  end

  # Redirect as appropriate when an access request fails.
  #
  # The default action when not logged in is to redirect to the login screen.
  # The default action when logged in, but not authorized is to redirect to /.
  #
  # Override this method in your controllers if you want to have special
  # behavior in case the user is not authorized
  # to access the requested action.  For example, a popup window might
  # simply close itself.
  def access_denied
    puts "here >#{AUTHENTICATION_REALM}<"
    request_http_basic_authentication(AUTHENTICATION_REALM)
  end

  # Store the URI of the current request in the session.
  #
  # We can return to this location by calling #redirect_back_or_default.
  def store_location
    session[:return_to] = request.url
  end

  # Redirect to the URI stored by the most recent store_location call or
  # to the passed default.  Set an appropriately modified
  #   after_filter :store_location, :only => [:index, :new, :show, :edit]
  # for any controller you want to be bounce-backable.
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  # Inclusion hook to make #current_user and #logged_in?
  # available as ActionView helper methods.
  def self.included(base)
    base.send :helper_method, :current_user, :logged_in?, :authorized? if base.respond_to? :helper_method
  end

  #
  # Login
  #
  def login_from_auth_data
    user = nil
    authenticate_with_http_basic() do |account, password|
      if !account.blank?
        if WEB_SERVER_AUTHENTICATES
          user = User.is_enabled.find_by_account(account)
        else
          user = User.authenticate(account, password)
        end
        if user.nil?
          logger.warn("Attempt by '#{account}' to login failed. Invalid account or password.")
        end
      end
    end
    return user
  end

# authenticate_with_http_basic makes this unnecessary
#  def get_auth_data
#    user, pass = '', ''
#    # extract authorisation credentials
#    if request.env.has_key? 'X-HTTP_AUTHORIZATION'
#      # try to get it where mod_rewrite might have put it
#      authdata = request.env['X-HTTP_AUTHORIZATION'].to_s.split
#    elsif request.env.has_key? 'HTTP_AUTHORIZATION'
#      # this is the regular location
#      authdata = request.env['HTTP_AUTHORIZATION'].to_s.split
#    end
#
#    # at the moment we only support basic authentication
#    if authdata && authdata[0] == 'Basic'
#      user, pass = Base64.decode64(authdata[1]).split(':')[0..1]
#    end
#    return [user, pass]
#  end
#

end
