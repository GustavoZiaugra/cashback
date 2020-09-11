require 'rails_helper'

RSpec.describe Admin::OffersController, type: :controller do
  context "Endpoints" do
    let(:offer)  { create(:offer) }

    describe "GET index" do
      it "returns 200 with index" do
        get :index
        expect(response).to have_http_status(200)
      end
    end

    describe "GET show" do
      it "returns 200 with show" do
        get :show, params: { id: offer.id }
        expect(response).to have_http_status(200)
      end
    end

    describe "DESTROY destroy" do
      it "return 200 with destroy" do
        delete :destroy, params: { id: offer.id }

        expect(response).to have_http_status(302)
        assert Offer.all == []
      end
    end

    describe "PATCH update" do
      it "return 200 with update" do
        patch :update, params: {id: offer.id, offer: { id: offer.id, premium: true } }

        expect(response).to have_http_status(302)
        offer.reload
        assert offer.premium == true
      end
    end
  end
end
