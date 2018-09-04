# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'should ensures first_name presence' do
      user = User.new(
        username: 'test',
        password: 'test',
        password_confirmation: 'test',
        middle_name: 'test',
        last_name: 'test',
        email: 'test@test.org'
      ).save

      expect(user).to eq(false)
    end

    it 'should let middle_name to be empty' do
      user = User.new(
        username: 'test',
        password: 'test',
        password_confirmation: 'test',
        first_name: 'test',
        middle_name: nil,
        last_name: 'test',
        email: 'test@test.org'
      ).save

      expect(user).to eq(true)
    end

    it 'should be able to save a user' do
      user = User.new(
        username: 'test',
        password: 'test',
        password_confirmation: 'test',
        first_name: 'test',
        middle_name: 'test',
        last_name: 'test',
        email: 'test@test.org'
      ).save

      expect(user).to eq(true)
    end

    it "should have a unique username" do
      User.create!(:username=>"test",
        :first_name=>"mariano",
        :last_name=>"pizzapopolis",
        :email=>"test@test.org",
        password: 'test',
        password_confirmation: 'test')
      user = User.new(:username=>"test",
        :first_name=>"maria",
        :last_name=>"pizzapopolisa",
        :email=>"teste@teste.com",
        password: 'teste',
        password_confirmation: 'teste')
      user.should_not be_valid
      user.errors[:username].should include("ya está en uso")
    end

    it "should not be valid without a password" do
      user = User.new password: nil, password_confirmation: nil
      user.should_not be_valid
    end

    it "should be not be valid with a short password" do
      user = User.new password: 'short', password_confirmation: 'short'
      user.should_not be_valid
    end

    it "should not be valid with a confirmation mismatch" do
      user = User.new password: 'short', password_confirmation: 'long'
      user.should_not be_valid
    end
    
    it "should get the full name of the user without middle name" do
      user = User.new(:username=>"test",
        :first_name=>"maria",
        :last_name=>"pizzapopolisa",
        :email=>"teste@teste.com",
        password: 'teste',
        password_confirmation: 'teste')
      expect(user.full_name).to eq "maria  pizzapopolisa"
    end

    it "should get the full name of the user with middle name" do
      user = User.new(:username=>"test",
        :first_name=>"maria",
        :last_name=>"pizzapopolisa",
        :middle_name=>"solange",
        :email=>"teste@teste.com",
        password: 'teste',
        password_confirmation: 'teste')
      expect(user.full_name).to eq "maria solange pizzapopolisa"
    end

  end
end
