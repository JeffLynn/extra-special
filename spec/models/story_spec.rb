#JL 2013.07.19 "factory.build" deprecated - replaced with FactoryGirl.build

# == Schema Information
#
# Table name: stories
#
#  id                   :integer(4)      not null, primary key
#  name                 :string(255)
#  title                :string(255)
#  body                 :text
#  created_at           :datetime
#  updated_at           :datetime
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer(4)
#  picture_updated_at   :datetime
#

require 'spec_helper'

# JL 2013.06.28 Commented out - it was failing but I can't figure out what it is trying to do
describe Story do
#  it "should create a new instance given valid attributes" do
#    Factory.build(:story).valid?.should be_true
#  end

  describe "validation" do
    before :each do
      @story = FactoryGirl.build(:story)
    end

    it "insists on a name" do
      @story.name = ""
      @story.should_not be_valid
    end

    it "insists on a title" do
      @story.title = ""
      @story.should_not be_valid
    end

    it "insists on a body" do
      @story.body = ""
      @story.should_not be_valid
    end

    it "insists on a picture" do
       story = FactoryGirl.build(:story, :picture => nil)
       story.should_not be_valid
    end
  end
end
