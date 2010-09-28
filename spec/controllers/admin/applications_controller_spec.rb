require 'spec_helper'

describe Admin::ApplicationsController do
  integrate_views
  
  #Delete this example and add some real ones
  it "should use Admin::StoriesController" do
    controller.should be_an_instance_of(Admin::ApplicationsController)
  end

  describe "not logged in" do
    it "Will get 401 if not authorised to access" do
      get :index
      response.should_not be_success
      response.code.should == "401"
    end
  end

  describe "when logged in" do
    before :each do
      login_as(User.new(:account => 'admin'))
    end

    describe "index page" do
      it "will get the index page" do
        get :index
        response.should be_success
      end

      it "will show an application in the list" do
        @application = Factory.create(:application)

        get :index
        response.should be_success
        
        response.should have_tag('a', :text => @application.name_of_applicant)
        response.should have_tag('a', :text => "delete")
      end
    end
  end
  
end