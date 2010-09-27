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
