FactoryBot.define do
  factory :comment do
    user
    article

    body { 'Something' }
  end
end
