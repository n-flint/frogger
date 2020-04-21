require 'rails_helper'

describe Article, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:body)}
  end

  describe 'relationships' do
    it {should have_many :comments}
    it {should have_many :taggings}
  end

  describe 'instance methods' do
    describe '#tag_list' do
      it "turns associated tags into a string" do
        article = Article.create(title: 'Article Uno', body: 'This is the body of article 1')
        article.tags.create(name: 'Tag 1')
        article.tags.create(name: 'Tag 2')

        expect(article.tag_list).to eq('Tag 1, Tag 2')
      end
    end
  end
end