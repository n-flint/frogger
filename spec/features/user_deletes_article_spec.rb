require 'rails_helper'

describe 'user deletes an article' do
  describe 'they link from the articles show page' do
    it "displays all articles without the deleted entry" do
      article_1 = Article.create(title: 'Article Uno', body: 'First Article Body')
      article_2 = Article.create(title: 'Article Dos', body: 'Second Article Body')

      visit article_path(article_2)

      click_link 'Delete This Article'

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(article_1.title)
      expect(page).to have_content("Article 'Article Dos' was Deleted!")
    end
  end
end