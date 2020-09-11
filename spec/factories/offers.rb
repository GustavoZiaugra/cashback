FactoryBot.define do
  factory :offer do
    id                       { 1 }
    advertiser_name          { "Wallmart" }
    url                      { "https://www.uol.com.br" }
    description              { "foobar" }
    starts_at                { DateTime.now }
    ends_at                  { DateTime.now }
    premium                  { false }
  end
end
