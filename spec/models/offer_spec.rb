require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe "default validations" do
    it { should validate_presence_of(:advertiser_name) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:starts_at) }
    it { should validate_length_of(:description) }
  end

  describe "custom validations" do
    it "should set default state before create" do
      offer = Offer.new(advertiser_name: "Wallmart", url: "https://www.uol.com.br/",
                        description: "foobar", starts_at: DateTime.now, ends_at: DateTime.now, premium: false)

      offer.save
      assert offer.state == "disabled"
    end

    it "should set state before save" do
      offer = Offer.new(advertiser_name: "Wallmart", url: "https://www.uol.com.br/",
                        description: "foobar", starts_at: DateTime.now - 1.hour, ends_at: DateTime.now, premium: false, state: "enabled")

      offer.save
      assert offer.state == "disabled"
    end

    it "should validates the url_format" do
      offer = Offer.new(advertiser_name: "Wallmart", url: "www.uol.com.br",
                        description: "foobar", starts_at: DateTime.now, ends_at: DateTime.now, premium: false)


      assert offer.valid? == false
    end
  end
end
