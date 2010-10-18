require 'spec_helper'

describe ApplicationHelper do
  include ApplicationHelper

  describe "actual_page?" do
    it "return seneded parameter if action match page name" do
      params['action'] = "about_us"
      actual_page?('about_us').should == 'about_us'
    end

    it "return string 'inactive' if action is different then page name" do
      params['action'] = "about_us"
      actual_page?('about_them').should == 'inactive'
    end
  end
end
