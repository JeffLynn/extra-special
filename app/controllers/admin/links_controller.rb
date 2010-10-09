class Admin::LinksController < Admin::AdminController
  def index
    @favourite_links = Link.find(:all, :order => 'ref ASC')
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params[:link])

    respond_to do |format|
      if @link.save
        flash[:notice] = 'Favourite was successfully created.'
        format.html { redirect_to admin_links_path }
        format.xml  { render :xml => @link, :status => :created, :location => @link }
      else
        format.html { render :action => 'new' }
        format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    respond_to do |format|
      if @link.update_attributes(params[:link])
        flash[:notice] = 'Favourite Link was successfully updated.'
        format.html { redirect_to admin_links_path }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to admin_links_path() }
    end
  end
  
end
