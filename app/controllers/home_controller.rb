class HomeController < ApplicationController
  
  def index
  end

  def about_us
  end

  def what_we_do
  end

  def stories
    @stories = Story.all(:order => 'name ASC')
    unless params[:story_id] && @story = Story.find_by_id(params[:story_id])
      if @stories && @stories.length > 0
        @story = @stories.first
      else
        @story = nil
      end
    end
  end

  def how_you_can_help
  end

  def how_to_apply
  end

  def contact_us
  end
  
end
