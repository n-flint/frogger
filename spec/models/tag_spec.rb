require 'rails_helper'

describe Tag, type: :model do
  describe 'realationships' do
    it {should have_many :taggings}
  end

  describe 'instance methods' do
    it '#tags_list' do
      article = Article.create!(title: 'Article Uno', body: 'This is the first article')
      article.tags.create(name: 'Tag 1')
      article.tags.create(name: 'Tag 2')

      expect(article.tag_list).to eq('Tag 1, Tag 2')
    end
  end
end