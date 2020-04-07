require 'rails_helper'

describe 'user sees all articles' do
  describe 'they visit /articles' do
    it 'displays all articles' do
      article_1 = Article.create(title: 'Title Uno', body: 'Body Uno')
      article_2 = Article.create(title: 'Title Dos', body: 'Body Dos')

      visit '/articles'

      expect(page).to have_link(article_1.title)
      expect(page).to have_link(article_2.title)
    end

    it 'has link to create new article' do
      visit '/articles'

      expect(page).to have_link('Create A New Article')
    end
  end
end