class Admin::ApplicationsController < Admin::AdminController
  def index
    @applications = Application.find(:all, :order => 'name_of_applicant ASC')
  end  
end