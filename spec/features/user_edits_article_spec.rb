require 'rails_helper'

describe 'user edits an article' do
  describe 'they link from the article show page' do
    it 'can edit a sinlge article' do
      article_1 = Article.create(title: 'Article Uno', body: 'First Article Body')

      visit article_path(article_1)

      click_link 'Edit This Article'

      expect(current_path).to eq(edit_article_path(article_1))

      fill_in "article[title]", with: 'Edited Title'
      fill_in 'article[body]', with: 'Edited Body'

      click_on 'Update Article'

      expect(current_path).to eq(article_path(article_1))
      expect(page).to have_content('Edited Title')
      expect(page).to have_content('Edited Body')
    end
  end
end