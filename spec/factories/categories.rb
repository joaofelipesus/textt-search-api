# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { Faker::Games::Zelda.unique.game }
    badge_color { '123abc' }
  end
end
