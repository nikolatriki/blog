require 'rails_helper'

RSpec.describe Article do
  describe 'association' do
    it { is_expected.to have_many(:comments)}
    it { is_expected.to belong_to(:user)}
  end

  describe 'dependency' do
    let(:article) {create(:article)}
    
    it 'destroys comments' do
      create_list(:comment, 1, article: article)
      expect { article.destroy }.to change { Comment.count }.by(-1)
    end
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(Article::MINIMUM_TITLE_LENGTH )}
  end
end
