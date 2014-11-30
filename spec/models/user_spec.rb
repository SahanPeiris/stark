require 'rails_helper'

RSpec.describe User, :type => :model do

  before :each do
    User.delete_all
    @user = User.new(name:"Sahan Peiris", password: "sahan1234", password_confirmation: "sahan1234",
                     email: "sapeirisw@gmail.com", ripple_account: "sapeiris")
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

  it "should only accept valid email addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user).to be_valid
    end
  end

  it "should reject invalid email addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com, @yolo.edu]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user).to_not be_valid
    end
  end

  it "should not allow users with duplicate emails" do
    dup_user = @user.dup
    @user.save
    expect(dup_user).to_not be_valid
  end

  it "should not allow users with duplicate emails even if there is a case mismatch" do
    dup_user = @user.dup
    dup_user.email = @user.email.upcase
    @user.save
    expect(dup_user).to_not be_valid
  end

  it "should have a password of minimum length" do
    @user.password = "a" * 5
    @user.password_confirmation = "a" * 5
    expect(@user).to_not be_valid
  end


end
