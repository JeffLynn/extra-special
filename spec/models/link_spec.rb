#JL 2013.07.19 "factory.build" deprecated - replaced with FactoryGirl.build()

require 'spec_helper'

describe Link do
  before(:each) do
    @valid_attributes =
    {
      :ref => 'http://example.com',
      :text => 'example.com'      
    }
  end

  # it "should create a new instance given valid attributes" do
  #   Link.create!(@valid_attributes)
  # end
  
  it "should validate the presence of ref" do
    link = FactoryGirl.build(:link, :ref=>'', :text=>'example.com')
    
    link.valid?.should == false
  end
  
  it "should validate the format of ref" do
    link = FactoryGirl.build(:link, :ref=>'www.example.com', :text=>'example.com')
    
    link.valid?.should == false
  end
  
  it "should validate the presence of text" do
    link = FactoryGirl.build(:link, :ref=>'http://example.com', :text=>'')
    
    link.valid?.should == false    
  end
  
 
end
