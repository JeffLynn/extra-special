require 'spec_helper'

describe HomeController do

  integrate_views
  
  describe "index" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end

  describe "about us" do
    it "should be successful" do
      get :about_us
      response.should be_success
    end
  end

  describe "what we do" do
    it "should be successful" do
      get :what_we_do
      response.should be_success
    end
  end

  describe "stories" do
    it "should be successful" do
      get :stories
      response.should be_success
      assigns[:story].should be_nil
      assigns[:stories].should == []
    end

    describe "with stories" do
      before :each do
        @story1 = Factory.create(:story, :name => "Nigel Taylor", :title => "Nigel Taylor's Story")
        @story2 = Factory.create(:story, :name => "Borja Arias", :title => "Borja Arias' Story")
        @story3 = Factory.create(:story, :name => "Tom Dickenson", :title => "Tom Dickenson's Story")
      end

      it "will default to the first story" do
        get :stories
        response.should be_success
        assigns[:story].should == @story2
        assigns[:stories].should == [@story2, @story1, @story3]
        response.should have_tag('h1', :text => @story2.title)
      end

      it "will mark the active story" do
        get :stories
        response.should be_success
        assigns[:story].should == @story2
        response.should have_tag('li.active', :text => @story2.name)
      end

      it "will show the first story for an invalid story" do
        get :stories, :story_id => '99999999999'
        response.should be_success
        assigns[:story].should == @story2
        response.should have_tag('li.active', :text => @story2.name)

      end

      it "will show the requested story" do
        get :stories, :story_id => @story3.id
        response.should be_success
        assigns[:story].should == @story3
        response.should have_tag('li.active', :text => @story3.name)
        response.should have_tag('h1', :text => @story3.title)
      end
    end
  end

  describe "how you can help" do
    it "should be successful" do
      get :how_you_can_help
      response.should be_success
    end
  end

  describe "how to apply" do
    it "should be successful" do
      get :how_to_apply
      response.should be_success
    end
  end

  describe "contact us" do
    it "should be successful" do
      get :contact_us
      response.should be_success
    end
  end

end
