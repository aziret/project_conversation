FactoryBot.define do
  factory :project do
    title { Faker::Lorem.sentence  }
    description { Faker::Quote.matz }
  end
end
