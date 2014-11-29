require 'rails_helper'

RSpec.describe User, :type => :model do

  before :each do
    User.delete_all
    @user = User.new(name:"Sahan Peiris", email: "sapeirisw@gmail.com",
            ripple_account: "sapeiris")
  end

  it "should be a valid user" do
    expect(@user).to be_valid
  end

  it "must have a valid name" do
    @user.name = "    "
    expect(@user).to_not be_valid
  end

  it "must have a valid email" do
    @user.email = "     "
    expect(@user).to_not be_valid
  end

  it "should not have a name that is too long" do
    @user.name = "a" * 51
    expect(@user).to_not be_valid
  end

  it "should not have an email that is too long" do
    @user.email = "a" * 256
    expect(@user).to_not be_valid
  end
  
end
