require 'rails_helper'

describe 'user creates a new article' do
  describe 'they link from the articles index page' do
    describe 'they fill in a title and a body' do
      it 'creates a new article' do
        visit articles_path

        click_link 'Create A New Article'

        expect(current_path).to eq(new_article_path)

        fill_in "article[title]", with: "New Title!"
        fill_in "article[body]", with: 'New Body, Oh Yeah!'
        fill_in "article[tag_list]", with: 'tigers, polygamy'

        click_on 'Create Article'

        expect(page).to have_content('New Title!')
        expect(page).to have_content('New Body, Oh Yeah!')
        expect(page).to have_content('tigers polygamy')
        expect(page).to have_content("Article 'New Title!' was Created!")
      end
    end
  end
end