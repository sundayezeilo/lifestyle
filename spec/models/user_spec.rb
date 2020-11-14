require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  describe 'validations' do
    context 'with valid attributes' do
      it 'should be valid' do
        expect(@user).to be_valid
      end
      it 'should respond to name' do
        expect(@user).to respond_to(:name)
      end

      it 'should respond to email' do
        expect(@user).to respond_to(:email)
      end

      it 'should respond to password' do
        expect(@user).to respond_to(:password)
      end

      it 'should be valid when email format is valid' do
        addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
        addresses.each do |valid_address|
          @user.email = valid_address
          expect(@user).to be_valid
        end
      end

      it 'should be saved as all lower-case' do
        mixed_case_email = 'Foo@ExAMPle.CoM'
        @user.email = mixed_case_email
        @user.save
        expect(@user.reload.email).to eq(mixed_case_email.downcase)
      end
    end

    context 'with invalid attributes' do
      it 'should not be valid when name is blank' do
        @user.name = ' '
        expect(@user).not_to be_valid
      end

      it 'should not be valid when email is blank' do
        @user.email = ' '
        expect(@user).not_to be_valid
      end

      it 'should not be valid when name is too long' do
        @user.name = 'a' * 51
        expect(@user).not_to be_valid
      end

      it 'should be invalid when email format is invalid' do
        addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com foo@bar..com]
        addresses.each do |invalid_address|
          @user.email = invalid_address
          expect(@user).not_to be_valid
        end
      end

      it 'should not be valid when email address is already taken' do
        @user_with_same_email = FactoryBot.create(:user)
        @user_with_same_email.email = @user.email
        @user_with_same_email.save
        expect(@user_with_same_email).not_to be_valid
      end
    end
  end

  describe 'articles associations' do
    context 'with article' do
      it 'should respond to articles' do
        expect(@user).to respond_to(:articles)
      end
    end
  end
end
