class Admin::StoriesController < Admin::AdminController
  def index
    @stories = Story.find(:all, :order => 'name ASC')
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(params[:story])

    respond_to do |format|
      if @story.save
        flash[:notice] = 'Story was successfully created.'
        format.html { redirect_to admin_stories_path }
        format.xml  { render :xml => @story, :status => :created, :location => @story }
      else
        format.html { render :action => 'new' }
        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    respond_to do |format|
      if @story.update_attributes(params[:story])
        flash[:notice] = 'Story was successfully updated.'
        format.html { redirect_to admin_stories_path }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to admin_stories_path() }
    end
  end
end
