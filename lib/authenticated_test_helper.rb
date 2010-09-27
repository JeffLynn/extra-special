module AuthenticatedTestHelper
  include AuthenticatedSystem
  # Sets the current user in the session.
  def login_as(user)
    controller.current_user = user
  end

  def authorize_as(user)
    controller.current_user = user
  end

end
