require 'rails_helper'

describe 'user sees one article' do
  describe 'they link from the artciles index' do
    it 'shows information for a single article' do
      article_1 = Article.create(title: 'Title Uno', body: 'Body Uno')
      article_2 = Article.create(title: 'Title Dos', body: 'Body Dos')

      comment_1 = article_1.comments.create(author_name: 'Joe Exotic', body: 'Did I tell you about Carol Baskins?')
      comment_2 = article_1.comments.create(author_name: 'Carol Baskins', body: 'Have you seen my husband?')

      visit '/articles'

      click_link article_1.title

      save_and_open_page

      expect(current_path).to eq(article_path(article_1))
      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
      expect(page).to_not have_content(article_2.title)
    end
  end
end