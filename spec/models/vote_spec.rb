require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'validations' do
    before do
      @user = FactoryBot.build(:user)
      @user.save

      @category = Category.new(name: 'fashion', priority: 1)
      @category.save

      @article = FactoryBot.build(:article, author: @user, categories: [@category])
      @article.save

      @vote = @user.votes.build(article_id: @article.id)
      @vote.save
    end

    context 'with invalid attributes' do
      it 'should not be valid without a user' do
        @vote.user = nil
        @vote.save
        expect(@vote).to_not be_valid
      end

      it 'should not be valid without an article' do
        @vote.article_id = nil
        @vote.save
        expect(@vote).to_not be_valid
      end
    end

    context 'with valid attributes' do
      it 'should be valid' do
        expect(@vote).to be_valid
      end

      it 'should have a author attribute' do
        expect(@vote).to respond_to(:user)
      end

      it 'should have a title attribute' do
        expect(@vote).to respond_to(:article)
      end
    end
  end
end
