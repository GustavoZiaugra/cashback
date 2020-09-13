require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe "default validations" do
    it { should validate_presence_of(:advertiser_name) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:starts_at) }
    it { should validate_length_of(:description) }
  end

  context "custom validations" do
    let(:offer) { create(:offer) }

    describe "set_default_state" do
      it "should set default state before create" do
        offer = Offer.new(advertiser_name: "Wallmart", url: "https://www.uol.com.br/",
                          description: "foobar", starts_at: DateTime.now, ends_at: DateTime.now, premium: false)

        offer.save
        assert offer.state == "disabled"
      end
    end

    describe "url_format" do
      it "should invalidates the url_format" do
        offer = Offer.new(advertiser_name: "Wallmart", url: "www.uol.com.br",
                          description: "foobar", starts_at: DateTime.now, ends_at: DateTime.now, premium: false)


        assert offer.valid? == false
      end

      it "should validates the url_format" do
        offer = Offer.new(advertiser_name: "Wallmart", url: "https://www.uol.com.br",
                          description: "foobar", starts_at: DateTime.now, ends_at: DateTime.now, premium: false)


        assert offer.valid? == true
      end
    end

    describe "set_state" do
      it "should set state before save" do
        offer = Offer.new(advertiser_name: "Wallmart", url: "https://www.uol.com.br/",
                          description: "foobar", starts_at: DateTime.now - 1.hour, ends_at: DateTime.now, premium: false, state: "enabled")

        offer.save
        assert offer.state == "disabled"
      end

      it "should change state to enabled when Datetime.now >= offer.starts_at" do
        offer.description = "foobar"
        offer.save

        assert offer.state == "enabled"
      end

      it "should change state to disabled when Datetime.now <= offer.starts_at" do
        offer.update_column(:starts_at, DateTime.now + 3.days)
        offer.description = "foobar"
        offer.save

        assert offer.state == "disabled"
      end

      it "should keep state as enable when offer.ends_at is blank" do
        offer.update_column(:ends_at, nil)
        offer.description = "foobar"
        offer.save

        assert offer.state == "enabled"
      end
    end
  end
end
