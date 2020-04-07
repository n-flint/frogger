require 'rails_helper'

describe 'user sees a welcome page' do
  describe 'they visit the root path' do
    it 'sees the welcome page' do
      visit '/' 
      expect(page).to have_content('Welcome to the Frogger')
    end

    it 'can link to all articles' do
      visit '/' 

      click_link 'All Articles'
      
      expect(current_path).to eq(articles_path)
    end
  end
end