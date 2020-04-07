require 'rails_helper'

describe 'user seesa all articles' do
  describe 'they visit /articles' do
    it 'displays all articles' do
      article_1 = Article.create(title: 'Title Uno', body: 'Body Uno')
      article_1 = Article.create(title: 'Title Dos', body: 'Body Dos')

      visit '/articles'

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_2.title)
    end
  end
end