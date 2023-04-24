# frozen_string_literal: true

FactoryBot.define do
  factory :status do
    name { 'open' }

    trait :to_do do
      name { 'to do' }
    end
  end
end
