require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
     @user = User.new(
      first_name: 'Kamylla',
      last_name: 'Almeida',
      email: 'k@gmail.com',
      password: '12345',
      password_confirmation: '12345'
    )
  end

  describe "Validations" do

    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end

    it "is not valid without first_name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "is not valid without last_name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "is not valid without email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "is not valid without password" do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it "is not valid without password_confirmation" do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it "is not valid when password and password_confirmation don't match" do
      @user.password = '123456'
      @user.password_confirmation = '654321'
      expect(@user).to_not be_valid
    end

    it "is not valid when email is registered" do
      @user.save
      new_user = User.new(
        first_name: 'Kamylla',
        last_name: 'Almeida',
        email: 'k@gmail.com',
        password: '12345',
        password_confirmation: '12345'
      )

      expect(new_user).to_not be_valid
    end

    it "is not valid when upper case email is registered" do
      @user.save
      new_user = User.new(
        first_name: 'Kamylla',
        last_name: 'Almeida',
        email: 'K@GmaiL.com',
        password: '12345',
        password_confirmation: '12345'
      )
      
      expect(new_user).to_not be_valid
    end

    it "is not valid when password length is less than 3" do
      @user.password = '1'
      @user.password_confirmation = '1'
    expect(@user).to_not be_valid
    end

    describe '.authenticate_with_credentials' do

      it "should login with valid credentials" do
        @user.save
        user1 = User.authenticate_with_credentials('k@gmail.com','12345')
        expect(user1).to eq(@user)
      end
      
      it "should not login with invalid credentials" do
        @user.save
        user1 = User.authenticate_with_credentials('k@gmail.com','123456')
        expect(user1).to be_nil
      end

      it "should login with upper case email" do
        @user.save
        user1 = User.authenticate_with_credentials('K@GmaiL.com','12345')
        expect(user1).to eq(@user)
      end

      it "should login with email with space" do
        @user.save
        user1 = User.authenticate_with_credentials(' k@gmail.com ','12345')
        expect(user1).to eq(@user)
      end




    end



    
  end
end 

