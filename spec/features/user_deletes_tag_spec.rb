require 'rails_helper'

describe 'user deletes a tag' do
  describe 'they link from the tag show page' do
    it 'displays all tags that were not deleted' do
      article = Article.create(title: 'First Article', body: 'Here lies the body of article 1.')

      tag_1 = Tag.create(name: 'Tag 1')
      tag_2 = Tag.create(name: 'Tag 2')

      article.tags << [tag_1, tag_2]

      visit tag_path(tag_1)

      click_link 'Delete This Tag'

      expect(current_path).to eq(tags_path)
      expect(page).to have_content("Tag 'Tag 1' was Deleted!")
      expect(page).to have_content('Tag 2')
    end
  end
end