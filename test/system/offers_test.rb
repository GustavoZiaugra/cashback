require "application_system_test_case"

class OffersTest < ApplicationSystemTestCase
  setup do
    @offer = offers(:one)
  end

  test "visiting the index" do
    visit offers_url
    assert_selector "h1", text: "Offers"
  end

  test "creating a Offer" do
    visit offers_url
    click_on "New Offer"

    fill_in "Advertiser name", with: @offer.advertiser_name
    fill_in "Description", with: @offer.description
    fill_in "Ends at", with: @offer.ends_at
    check "Premium" if @offer.premium
    fill_in "Starts at", with: @offer.starts_at
    fill_in "Url", with: @offer.url
    click_on "Create Offer"

    assert_text "Offer was successfully created"
    click_on "Back"
  end

  test "updating a Offer" do
    visit offers_url
    click_on "Edit", match: :first

    fill_in "Advertiser name", with: @offer.advertiser_name
    fill_in "Description", with: @offer.description
    fill_in "Ends at", with: @offer.ends_at
    check "Premium" if @offer.premium
    fill_in "Starts at", with: @offer.starts_at
    fill_in "Url", with: @offer.url
    click_on "Update Offer"

    assert_text "Offer was successfully updated"
    click_on "Back"
  end

  test "destroying a Offer" do
    visit offers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Offer was successfully destroyed"
  end
end
