require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'association' do
    it { is_expected.to belong_to(:article)}
    it { is_expected.to belong_to(:user)}
  end

  describe 'validation' do
    it { should validate_presence_of(:body) }
  end
end
