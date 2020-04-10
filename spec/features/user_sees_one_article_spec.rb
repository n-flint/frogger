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

  describe "they fill in a comment form" do
    it "displays the comment on the article show" do
      article = Article.create!(title: "New Title", body: "New Body")

      visit article_path(article)

      fill_in "comment[author_name]", with: "Doc Antel"
      fill_in "comment[body]", with: "I would never euthenize my tigers, that's crazy..."
      click_on "Submit"

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content("Post A Comment")
      expect(page).to have_content("Doc Antel")
      expect(page).to have_content("I would never euthenize my tigers, that's crazy...")
    end
  end

  describe 'it shows the number of comments' do
    it 'can see the number of comments' do
      article = Article.create!(title: "New Title", body: "New Body")
      comment_1 = article.comments.create(author_name: 'Joe Exotic', body: 'Did I tell you about Carol Baskins?')
      comment_2 = article.comments.create(author_name: 'Carol Baskins', body: 'Have you seen my husband?')

      visit article_path(article)

      expect(page).to have_content('Comments: (2)')
    end
  end
end