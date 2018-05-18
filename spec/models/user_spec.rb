require 'rails_helper'

RSpec.describe User, :type => :model do
    context "validation tests" do

        it 'should ensures first_name presence' do
            user = User.new({
                username: 'test',
                password: 'test',
                password_confirmation: 'test',
                middle_name: 'test',
                last_name: 'test',
                email: 'test@test.org'
            }).save
            
            expect(user).to eq(false)
        end

        it 'should let middle_name to be empty' do
            user = User.new({
                username: 'test',
                password: 'test',
                password_confirmation: 'test',
                first_name: 'test',
                middle_name: nil,
                last_name: 'test',
                email: 'test@test.org'
            }).save

            expect(user).to eq(true)
        end

        it 'should be able to save a user' do
            user = User.new({
                username: 'test',
                password: 'test',
                password_confirmation: 'test',
                first_name: 'test',
                middle_name: 'test',
                last_name: 'test',
                email: 'test@test.org'
            }).save
            
            expect(user).to eq(true)
        end
    end
    
end