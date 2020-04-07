require 'rails_helper'

describe 'user sees one article' do
  describe 'they link from the artciles index' do
    it 'shows information for a single article' do
      article_1 = Article.create(title: 'Title Uno', body: 'Body Uno')
      article_2 = Article.create(title: 'Title Dos', body: 'Body Dos')

      visit '/articles'

      click_link article_1.title

      expect(current_path).to eq(article_path(article_1))
      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
      expect(page).to_not have_content(article_2.title)
    end
  end
end