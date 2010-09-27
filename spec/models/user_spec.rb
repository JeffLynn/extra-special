
require 'spec_helper'

describe User do
    PASSWORD = 'rails-rocks1'
    ACCOUNT = 'railed'

  it "should create a new instance given valid attributes" do
    Factory.build(:user).should be_valid
  end

  it "expects an account, email and user" do
    user = Factory.build(:user)
    user.account = ''
    user.name = ''
    user.email = ''
    user.save.should be_false
    user.errors.length.should eql(3)
    user.errors[:name].should_not be_nil
    user.errors[:account].should_not be_nil
    user.errors[:email].should_not be_nil
  end

  it "expects password to be at least 5 characters long" do
    user = Factory.build(:user)
    user.password = '1234'
    user.save.should be_false
    user.errors.length.should eql(1)
    user.errors[:password].should_not be_nil
  end

  it "expects password to be contain at least 1 numeric" do
    user = Factory.build(:user)
    user.password = 'abcde'
    user.save.should be_false
    user.errors.length.should eql(1)
    user.errors[:password].should_not be_nil
  end

  it "should validate the password and confirmation match" do
    user = Factory.build(:user)
    user.password = 'wibble2'
    user.password_confirmation = 'wobble2'
    user.save.should be_false
    user.errors.length.should eql(1)
  end

  it "should authenticate the user" do
    user = Factory.create(:user, :account => ACCOUNT, :password => PASSWORD)
    user.hashed_password.should_not eql(PASSWORD)

    user2 = User.authenticate(ACCOUNT, PASSWORD)
    user2.should_not be_nil
    user2.should eql(user)
  end

  it "should reject invalid password" do
    user = Factory.create(:user, :account => ACCOUNT, :password => PASSWORD)

    user2 = User.authenticate(ACCOUNT, PASSWORD + 'A')
    user2.should be_nil
  end

  it "should reject invalid account" do
    user = Factory.create(:user, :account => ACCOUNT, :password => PASSWORD)

    user2 = User.authenticate(ACCOUNT + 'A', PASSWORD)
    user2.should be_nil
  end
end

