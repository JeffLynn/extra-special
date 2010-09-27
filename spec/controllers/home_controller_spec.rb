require 'spec_helper'

describe HomeController do

  integrate_views
  
  describe "index" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end

end
