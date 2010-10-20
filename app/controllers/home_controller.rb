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

  def contact_us
  end

  def favourites
    @favourite_links_odd = []
    @favourite_links_even = []
    key = 1
    Link.find(:all).each do |link|
      if key.odd?
        @favourite_links_odd << link 
      else
        @favourite_links_even << link
      end
      key += 1
    end
  end
  
end
