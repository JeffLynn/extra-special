class Admin::AdminController < ApplicationController
  layout 'admin'
  
  include AuthenticatedSystem

  before_filter :login_required
end
