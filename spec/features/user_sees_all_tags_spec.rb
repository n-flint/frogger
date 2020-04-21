require 'rails_helper' 

describe 'user sees all tags' do
  describe 'they link from articles index page' do
    it 'shows all tags with all information' do
      article = Article.create(title: 'Title Uno', body: 'This is the body for article numero uno')
      tag_1 = Tag.create(name: 'Interesting')
      tag_2 = Tag.create(name: 'Boring')
      tag_3 = Tag.create(name: 'Tigers')

      article.tags << [tag_1, tag_2, tag_3]

      visit articles_path

      click_link('All Tags')

      expect(current_path).to eq(tags_path)
      expect(page).to have_content('All Tags')
      expect(page).to have_content('Interesting')
      expect(page).to have_content('Boring')
      expect(page).to have_content('Tigers')
    end
  end
end