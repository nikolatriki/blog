require 'rails_helper'

RSpec.describe "HomePages", type: :system do
  before do
    driven_by(:rack_test)
    # driven_by(:selenium, using: :headless_chrome)
    visit root_path
  end

  
  it 'shows the Home link' do
    expect(page.has_link?('My Blog')).to be true
  end

  context 'When no user is signed in' do
    it 'shows the Log in link' do
      expect(page.has_link?('Log in')).to be true
    end
    it 'shows the Sign up link' do
      expect(page.has_link?('Sign up')).to be true
    end
  end

  context 'When user is signed in into the app' do
    before do
      log_in(create(:user))

      visit root_path
    end

    it 'shows the New Article link' do
      expecting = page.has_link?('New Article')

      expect(expecting).to be true
    end

    it 'shows the Logout link' do
      expecting = page.has_link?('Log out')

      expect(expecting).to be true
    end
  end

  context 'When an article is present' do
    let!(:article) { create(:article, title: 'Testing title with Rspec', body: 'Testing body with Rspec')}

    before do
      visit root_path
    end

    it 'shows the article title' do
      expect(page.has_content?(article.title)).to be true
    end

    it 'shows the article body' do
      expect(page.has_content?(article.body)).to be true
    end

    it 'shows the link to article' do
      expect(page.has_content?('Show')).to be true
    end
  end

end
