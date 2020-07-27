require 'rails_helper'

RSpec.describe "ArticlesInteraction", type: :system do
  let(:article) { create(:article, user: user) }
  let(:user) { create(:user) }


  before do
    driven_by :rack_test

    # visit article_path(article)
    log_in(user)
  end

  describe 'Creating an article' do
    it 'creats and shows the newly created article' do
      title = 'Create new system spec'
      body = 'This is the body'
      click_on('New Article')

      within('form') do
        fill_in 'Title', with: title
        fill_in 'Body', with: body

        click_on 'Save article'
      end

      expect(page).to have_content(title)
      expect(page).to have_content(body)
    end
  end

  describe 'Editing an article' do
    it 'edits and shows the article' do
      title = 'New title'
      body = 'New body'

      visit article_path(article)

      click_on 'Edit'

      within('form') do
        fill_in 'Title', with: title
        fill_in 'Body', with: body

        click_on 'Update article'
      end

      expect(page).to have_content(title)
      expect(page).to have_content(body)
    end


  end

  describe ' Deleting an article' do
    it 'deletes the article' do
      visit article_path(article)

      click_on 'Delete'

      expect(page).to have_content('Articles')
    end
  end

  describe 'Creating new article comment' do
    it 'creates new comment on article' do
      body = 'New comment body'

      visit article_path(article)

      click_on 'New comment'

      within('form') do
        fill_in 'Body', with: body

        click_on 'Comment'
      end

      expect(page).to have_content(body)
    end

  end
end

