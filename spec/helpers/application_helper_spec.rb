require 'spec_helper'

describe ApplicationHelper do
  include ApplicationHelper

  describe "actual_page?" do
    it "return string 'active' if action match page name" do
      params['action'] = "about_us"
      actual_page?('about_us').should == 'active'
    end

    it "return string 'inactive' if action is different then page name" do
      params['action'] = "about_us"
      actual_page?('about_them').should == 'inactive'
    end
  end
end
