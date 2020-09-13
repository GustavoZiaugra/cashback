# frozen_string_literal: true

FactoryBot.define do
  factory :offer do
    id                       { 1 }
    advertiser_name          { 'Wallmart' }
    url                      { 'https://www.uol.com.br' }
    description              { 'foobar' }
    starts_at                { DateTime.now - 1.day }
    ends_at                  { DateTime.now }
    premium                  { false }
  end
end
