require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @user.save

    @article = FactoryBot.build(:article, author: @user)

    @category = Category.new(name: 'fashion', priority: 1)
    @category.save
  end

  describe 'validation' do
    describe 'validations' do
      it 'should be valid' do
        @article.categories << @category
        expect(@article).to be_valid
      end

      it 'should have a author attribute' do
        expect(@article).to respond_to(:author)
      end

      it 'should have a title attribute' do
        expect(@article).to respond_to(:title)
      end

      it 'should have a text attribute' do
        expect(@article).to respond_to(:text)
      end

      it 'should have a title attribute' do
        expect(@article).to respond_to(:title)
      end
    end

    context 'with invalid attributes' do
      it 'should not be valid without an author' do
        @article.author = nil
        @article.save
        expect(@article).to_not be_valid
      end

      it 'should not be valid without a title' do
        @article.title = ' '
        @article.save
        expect(@article).to_not be_valid
      end

      it 'should not be valid without content' do
        @article.text = ' '
        @article.save
        expect(@article).to_not be_valid
      end

      it 'should not be valid with invalid category' do
        @article.categories << []
        @article.save
        expect(@article).to_not be_valid
      end
    end

    context 'with valid attributes' do
      it 'should be valid' do
        @article.categories << @category
        @article.save
        expect(@article).to be_valid
      end
    end

    context 'with valid attributes with more than one category' do
      before do
        @second_category = Category.new(name: 'business', priority: 2)
        @second_category.save
      end

      it 'should be valid' do
        @article.categories << @category
        expect(@article).to be_valid
      end

      it 'should populate categories' do
        @article.categories << [@category, @second_category]
        @article.save
        expect(@article.reload.categories).to eq([@category, @second_category])
      end
    end

    context 'article order scope' do
      before do
        @category = Category.new(name: 'business', priority: 2)
        @category.save

        @older_article = FactoryBot.build(:article, author: @user, created_at: 1.day.ago)
        @older_article.categories << @category
        @older_article.save

        @newer_article = FactoryBot.build(:article, author: @user, created_at: 1.hour.ago)
        @newer_article.categories << @category
        @newer_article.save
      end

      it 'should have the right articles in the right order' do
        expect(Article.all.order_most_recent).to eq([@newer_article.reload, @older_article.reload])
      end
    end
  end

  describe 'associations' do
    context 'with categories' do
      it 'should respond to categories' do
        expect(@article).to respond_to(:categories)
      end
    end

    context 'with author' do
      it 'should respond to author' do
        expect(@article).to respond_to(:author)
      end

      it 'should be destroyed with associated author' do
        @article.categories << @category
        @article.save
        author = @article.author
        User.find(author.id).destroy
        expect(Article.find_by(author: author)).to be_nil
      end
    end

    context 'with votes' do
      before do
        @article.categories << @category
        @article.save
        @vote = @user.votes.build(article_id: @article.id)
        @vote.save
      end

      it 'should respond to votes' do
        expect(@article).to respond_to(:votes)
      end

      it 'should have a valid vote' do
        expect(@article.reload.votes).to_not be_empty
      end

      it 'should have the right votes' do
        expect(@article.reload.votes).to include(@vote)
      end

      it 'should be destroyed with associated votes' do
        @article.reload.destroy
        expect(Vote.find_by(id: @vote.id)).to be_nil
      end
    end
  end
end
