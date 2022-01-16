# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { Faker::Games::Zelda.unique.game }
    badge_color { Faker::Color.hex_color }
  end
end
