class ApplyController < ApplicationController
  def new
    @application = Application.new
  end

  def create
    @application = Application.new(params[:application])

    respond_to do |format|
      if @application.save
        flash[:notice] = 'Your Application has been submitted.'
        format.html { redirect_to root_path }
        format.xml  { render :xml => @application, :status => :created, :location => @application }
      else
        format.html { render :action => 'new' }
        format.xml  { render :xml => @application.errors, :status => :unprocessable_entity }
      end
    end  end

end
