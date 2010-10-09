class Admin::ApplicationsController < Admin::AdminController
  def index
    @applications = Application.find(:all, :order => 'name_of_applicant ASC')
  end  
  
  def show
    begin
      @application = Application.find(params[:id])
    rescue
      flash[:notice] = "The Application you were looking for doesn't exist"
      respond_to do |format|
        format.html { redirect_to admin_applications_path() }
      end
       
    end
  end
  
  def destroy
    @application = Application.find(params[:id])
    @application.destroy

    respond_to do |format|
      format.html { redirect_to admin_applications_path() }
    end
  end

end