require 'rails_helper'

describe 'user sees sinlge tag' do
  describe 'they link from article show page' do
    it 'shows all tag information' do
      article = Article.create(title: 'Title Uno', body: 'This is the body for article numero uno')

      tag = Tag.create(name: 'Interesting')
      article.tags << tag

      visit article_path(article)

      click_link 'Interesting'

      expect(current_path).to eq(tag_path(tag))
      expect(page).to have_content('Interesting')
    end
  end
end